module Api
  module V1
    class ReportsController < ApplicationController
      def index
        @report = Report.order('created_at DESC')
        render json: @report
      end

      def create
        @post = Post.find_by(postfind_params)
        @report = @post.reports.new(report_params)
        if @report.save
          #render json:@user
          render json: @user , status: :created #json: @user ,
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private
      def report_params
        params.require(:report).permit(:report_text,:rep_user_id)
      end
      def find_params
        params.permit(:rep_user_id)
      end
      def postfind_params
        params.permit(:chatkey)
      end
    end
  end
end

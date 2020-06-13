module Api
  module V1
    class UsersController < ApplicationController
      def index
        @user = User.order('created_at DESC')
        render json: @user
      end

      def create
        @user = User.new(user_params)
        if @user.save
          #render json:@user
          render json: @user , status: :created #json: @user ,
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        @user = User.find_by(uuid_params)
        if params[:latetude]
        @user.latetude = params[:latetude]
        end
        if params[:longitude]
        @user.longitude = params[:longitude]
        end
        if params[:radius]
        @user.radius = params[:radius]
        end
        if params[:name]
        @user.name = params[:name]
        end
        if @user.save
        render json: @user
        end
      end

      def destroy

        @user = User.find_by(uuid_params)

        if @user
          @user.posts.destroy
          @user.destroy
          render json: {user:"delete"}, starus: :found
        else
          render json: {user: "not found"}, status: :not_found
        end
      end

      private

      def uuid_params
        params.permit(:uuid)
      end

      def user_params
        params.require(:user).permit(:name,:latetude,:longitude)
      end
    end
  end
end

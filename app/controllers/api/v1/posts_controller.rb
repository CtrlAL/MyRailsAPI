module Api
  module V1
    class PostsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      before_action :authenticate, only: [:index, :create, :destroy]
      PI = 3.14159265358

      def index
        @posts = @tokuser.posts.order('created_at DESC')
        render json: @posts
      end

      def create
        @user = User.find_by(uuid_params)
        if @tokuser.longitude and @tokuser.latetude and  @user.latetude and @user.longitude and @user.radius
        @Qlongi = @user.longitude - @tokuser.longitude
        @Qlate  = @user.latetude - @tokuser.latetude
        @Qlongi = @Qlongi * (40075.696/360) * Math.cos(@Qlate*PI/180)
        @Qlate = @Qlate * (40008.55/360)
        @Qlongi *= @Qlongi
        @Qlate *=@Qlate
        @QR = @user.radius * @user.radius
        if ((@Qlongi + @Qlate) <= @QR)
        @post = @user.posts.new(post_params)
        @post.save
        else
        render json: {user: "Not for this user"}, status: :not_found
        end
      else
      render json: {user:"Unpermited user"}
      end
      end

      def destroy
        @post = @user.posts.find_by(post_params_delete)
        if @post
          render json: @post
          @post.destroy
        else
          render json: {post: "not found"}, status: :not_found
        end
      end

      private

      def uuid_params
        params.permit(:uuid)
      end

      def post_params
        params.require(:post).permit(:title, :body,:author,:chatkey)
      end

      def post_params_delete
        permit(:chatkey)
      end

      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @tokuser = User.find_by(token: token)
        end
      end

    end
end
end

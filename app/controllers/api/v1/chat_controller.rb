module Api
  module V1
    class ChatController < ApplicationController
    def index
      #@posts = Post.order('created_at DESC')
      @chat = Chat.order('created_at DESC')
      render json: @chat
    end
    def create
      @chat = Chat.new(chat_params)
      if @chat.save
        #render json:@user
        render json: @chat , status: :created #json: @user ,
      else
        render json: @chat.errors, status: :unprocessable_entity
      end
    end
    def update
      @chat = Chat.find_by(chat_fparams)
      @user = User.find_by(uuid_params)
      @chat.users << [@user]
      @chat.save
      render json: @chat
    end
    def destroy
      @chat = Chat.find_by(chat_fparams)
      if @chat
      @chat.destroy
      render @chat
      else
      render json: {post: "not found"}, status: :not_found
      end
    end
    private
    def chat_params
      params.permit(:title,:chatkey,:users)
    end
    def chat_fparams
      params.permit(:chatkey)
    end
    def uuid_params
      params.permit(:uuid)
    end
  end
  end
end

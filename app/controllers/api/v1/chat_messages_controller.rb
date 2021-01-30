module Api
  module V1
    class ChatMessagesController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate, only: [:create, :destroy]
    def index
      @chat = Chat.find_by(chat_for_message_params)
      @chat_messages = @chat.chat_messages
      render json: @chat_messages
    end

    def create
    if params[:chatkey]
    @chat = @user.chats.find_by(chat_for_message_params)
    @chat_message =  @chat.chat_messages.new(chat_message_params)
    @chat_message.user = @user
    if @chat_message.save
        render json: @chat_message
        else
        render json: @chat_message.errors ,status:  :unprocessable_entity
      end
    end
    end


    def destroy
      @chat = Chat.find_by(chat_for_message_params)
      @chat_message = @chat.chat_message.find_by(id_id)
      if @chat_message
        @chat_message.destroy
        render json: @chat_message
      else
        render json: {chat_message: "not found"}, status: :not_found
      end
    end

    def update
      @chat = Chat.find_by(chat_for_message_params)
      @chat_message = @chat.chat_message.find_by(id_id)
      @chat_message.text = params[:text]
      render json: @chat_message
    end

    private
    def chat_message_params
      params.permit(:text)
    end
    def chat_for_message_params
      params.permit(:chatkey)
    end
    def uuid_params
      params.permit(:uuid)
    end
    def id_id
      params.permit(:id)
    end
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        @user = User.find_by(token: token)
      end
    end
  end
  end
end

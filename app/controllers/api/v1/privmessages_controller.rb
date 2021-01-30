module Api
  module V1
    class PrivmessagesController < ApplicationController

      def index
        @chat = Pchat.find_by(privchat_for_message_params)
        @chat_messages = @chat.privmessages
        render json: @chat_messages
      end

      def create
        @user = User.find_by(uuid_params)
        @chat = Pchat.find_by(privchat_for_message_params)
        @chat_message =  @chat.privmessages.new(chat_privmessage_params)
        @chat_message.user = @user
        if @chat_message.save
          render json: @chat_message
        else
          render json: @chat_message.errors ,status:  :unprocessable_entity
        end
      end

      def destroy
        @chat = Pchat.find_by(privchat_for_message_params)
        @chat_message = @chat.privmessages.find_by(id_id)
        if @chat_message
          @chat_message.destroy
          render json: @chat_message
        else
          render json: {primmessage: "not found"}, status: :not_found
        end
      end

      def update
        @chat = Pchat.find_by(privchat_for_message_params)
        @chat_message = @chat.privmessages.find_by(id_id)
        @chat_message.mestext = params[:mestext]
        render json: @chat_message
      end


      private

      def chat_privmessage_params
        params.permit(:mestext)
      end

      def privchat_for_message_params
        params.permit(:chatid)
      end

      def uuid_params
        params.permit(:uuid)
      end

      def id_id
        params.permit(:id)
      end

  end
end
end

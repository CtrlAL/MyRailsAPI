module Api
  module V1
    class PchatsController < ApplicationController
      def index
          @user = User.find_by(aut_chat_params)
          @chat = @user.pchat.order('created_at DESC')
        render json: @chat
      end
      def create
        @chat = Pchat.find_by(p_chat_id)
        if @chat
        render json: "Already exist"
        else
        @chat = Pchat.new(p_chat_params)
        @aut = User.find_by(aut_chat_params)
        @rec = User.find_by(uuid: @chat.adress_user)
        @chat.users << [@aut]
        @chat.users << [@rec]
          if @chat.save
            render json: @chat , status: :created #json: @user ,
          else
             render json: @chat.errors, status: :unprocessable_entity
          end
        end
      end
      def destroy
        @chat = Pchat.find_by(p_chat_id)
        if @chat
          @chat.privmessages.destroy
          @chat.destroy
          render json: {user:"delete"}, starus: :found
        else
          render json: {user: "not found"}, status: :not_found
        end
      end

      private

      def p_chat_params
        params.permit(:adress_user,:chatid)
      end

      def aut_chat_params
        params.permit(:uuid)
      end

      def rec_chat_params
        params.permit(:adress_user)
      end
      def p_chat_id
        params.permit(:chatid)
      end

  end
end
end

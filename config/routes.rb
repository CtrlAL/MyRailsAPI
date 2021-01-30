Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :posts
      #put "/users/:id" => "users#update" # обычно отправляемая пользователем заполненная форма
      resources :users
      resources :chat_messages
      resources :chat
      resources :reports
      resources :pchats
      resources :privmessages
      #resolve('Users') { [:users] }
      end
      #put '/api/v1/users', to: 'users#update', as: 'users'
    end
  end

Rails.application.routes.draw do

  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do 
      devise_scope :user do
      
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        get 'profile' => 'profile#show'
        get 'profile_user/:id' => 'profile#showOther'
        get 'list_user' => 'profile#listUser'
        delete 'message/delete/:id' => 'deleteds#message'
        delete 'conversation/delete/:id' => 'deleteds#conversation'
        resources :conversations, only: [:index, :create] do
          resources :messages, only: [:index, :create]
        end
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

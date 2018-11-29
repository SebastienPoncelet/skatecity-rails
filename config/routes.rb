Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #route for Wechat Open_Id verification
  post '/login', to: 'login#login'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :spots, only: [ :index, :show, :create, :update]
      resources :users, only: [ :index, :show ]
    end
  end
end

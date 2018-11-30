Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #route for Wechat Open_Id verification
  post '/login', to: 'login#login'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :spots, only: [:index, :show, :create, :update]
      resources :users, only: [:index, :show]
      # Don't need to have index and show because we can get the images through the spots
      # example, spot.images will bring out all related images.
      resources :images, only: [:create, :update]
    end
  end
end

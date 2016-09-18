Rails.application.routes.draw do
  resources :ingredients, :sandwiches
  namespace :api do
    namespace :v1 do
      resources :sandwiches, except: [:new, :edit] do
        resources :ingredients, except: [:new, :edit, :update]
      end
    end
  end
  post '/api/v1/sandwiches/:sandwich_id/ingredients/add', to: 'api/v1/sandwiches#add_ingredient', :as => 'add_ingredient'
end

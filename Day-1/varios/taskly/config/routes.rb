Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  #resources :tasks

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit] do
        resources :tasks, except: [:new, :edit, :update]
          post 'tasks/:id/complete' => 'tasks#complete'
      end
    end
  end
end
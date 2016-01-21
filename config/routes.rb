Rails.application.routes.draw do
  root 'welcomes#index'

  resources :people, except: [:show] do
    resources :phone_numbers, except: [:show, :index]
  end
end

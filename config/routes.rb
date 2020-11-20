Rails.application.routes.draw do
  # get 'appointments/index'
  # get 'appointments/new'
  # get 'doctors/index'
  # get 'doctors/show'
  # get 'doctors/new'
  # get 'patients/index'
  # get 'patients/show'
  # get 'patients/new'

  root 'doctors#index'

  resources :patients
  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy] # the only: has something to do with rails/info/routes in localhost (I think)
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

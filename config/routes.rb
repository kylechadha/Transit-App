TransitAppThree::Application.routes.draw do

  resources :welcome, only: [:index]
  resources :users, only: [:index, :show, :create, :new]
  resources :routes, only: [:index, :show, :edit, :update, :destroy]

end

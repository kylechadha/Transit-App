TransitAppThree::Application.routes.draw do

  get "journeys/index"
  get "journeys/show"
  get "journeys/new"
  get "journeys/create"
  get 'stops/destination/:id', :to => "stops#destination", as: "stops_destination"

  resources :welcome, only: [:index]
  resources :users, only: [:index, :show, :create, :new]
  resources :stops, only: [:index, :show, :edit, :update, :destroy]
  resources :routes, only: [:index, :show, :edit, :update, :destroy]

end

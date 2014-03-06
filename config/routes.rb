TransitAppThree::Application.routes.draw do

    get 'stops/destination/:id', :to => "stops#destination", as: "stops_destination"
  get 'stops/selection', :to => "stops#selection", as: "stops_selection"

  resources :welcome, only: [:index]
  resources :users, only: [:index, :show, :create, :new]
  resources :stops, only: [:index, :show, :edit, :update, :destroy]
  resources :routes, only: [:index, :show, :edit, :update, :destroy]
  resources :alerts
end

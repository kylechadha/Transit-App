TransitAppThree::Application.routes.draw do

  get 'journeys/destination/:id', :to => "journeys#destination", as: "journeys_destination"
  get 'journeys/selection', :to => "journeys#selection", as: "journeys_selection"

  resources :welcome, only: [:index]
  resources :users, only: [:index, :show, :create, :new]
  resources :stops, only: [:index, :show, :edit, :update, :destroy]
  resources :routes, only: [:index, :show, :edit, :update, :destroy]
  resources :journeys

end

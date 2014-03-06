TransitAppThree::Application.routes.draw do

  root 'journeys#selection'    

  get 'journeys/selection', :to => "journeys#selection", as: "journeys_selection"
  get 'journeys/destination/:id', :to => "journeys#destination", as: "journeys_destination"
  get 'journeys/preferences/:id', :to => "journeys#preferences", as: "journeys_preferences"
  get 'journeys/mapview/:id', :to => "journeys#mapview", as: "journeys_mapview"

  resources :welcome, only: [:index]
  resources :users, only: [:index, :show, :create, :new]
  resources :stops, only: [:index, :show, :edit, :update, :destroy]
  resources :routes, only: [:index, :show, :edit, :update, :destroy]
  resources :journeys

end

Rails.application.routes.draw do

  root "events#index"

  # get "events/new" => "events#new", as: "new_event"
  # get "events" => "events#index"
  # get "events/:id" => "events#show", as: "event"
  # get "events/:id/edit" => "events#edit", as: "edit_event"
  # patch "events/:id" => "events#update"
  # post "events" => "events#create"
  # delete "events" => "events#delete"

  # All the above routes can be achieved with just one line of code.

  resources :events

end

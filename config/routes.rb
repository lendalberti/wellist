Rails.application.routes.draw do

  root 'home#show'

  get '/user/:id',          to: 'home#show',   as: :home

  post   '/api/add/:id',        to: 'api#create',  as: :api_add_vendor
  post   '/api/hide/:id',       to: 'api#update',  as: :api_toggle_vendor
  delete '/api/remove/:id',     to: 'api#destroy', as: :api_remove_vendor



end


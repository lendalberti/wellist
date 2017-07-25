Rails.application.routes.draw do

  root 'home#show'

  get '/user/:id',      to: 'home#show',   as: :home

  post   '/api/add',    to: 'api#create',  as: :api_add_vendor
  post   '/api/hide',   to: 'api#update',  as: :api_toggle_vendor
  delete '/api/remove', to: 'api#destroy', as: :api_remove_vendor



end


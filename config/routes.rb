Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome page
  get '/', to: 'welcome#index'

  #schools
  get '/schools', to: 'schools#index'
  get '/schools/new', to: 'schools#new'
  post '/schools', to: 'schools#create'
  get '/schools/:id', to: 'schools#show'
  get '/schools/:id/edit', to: 'schools#edit'
  patch '/schools/:id', to: 'schools#update'
  delete '/schools/:id', to: 'schools#destroy'

  #teachers

  #dealers
  get '/dealers', to: 'dealers#index'
  get '/dealers/new', to: 'dealers#new'
  post '/dealers', to: 'dealers#create'
  get '/dealers/:id', to: 'dealers#show'
  get '/dealers/:id/edit', to: 'dealers#edit'
  patch '/dealers/:id', to: 'dealers#update'
  delete '/dealers/:id', to: 'dealers#destroy'
  get 'dealers/:id/instruments', to: 'dealers#instruments'
  get 'dealers/:id/instruments/new', to: 'dealers#new_instrument'
  patch 'dealers/:id/instruments', to: 'dealers#create_instrument'

  #instruments
  get '/instruments', to: 'instruments#index'
  get '/instruments/:id', to: 'instruments#show'
  get '/instruments/:id/edit', to: 'instruments#edit'
  patch '/instruments/:id', to: 'instruments#update'
  delete '/instruments/:id', to: 'instruments#destroy'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome page
  get '/', to: 'welcome#index'

  #schools
  get '/schools', to: 'schools#index'
  get '/schools/new', to: 'schools#new'
  get '/schools/:id', to: 'schools#show'
  post '/schools', to: 'schools#create'

  #dealers
  get '/dealers', to: 'dealers#index'
  get '/dealers/new', to: 'dealers#new'
  get '/dealers/:id', to: 'dealers#show'
end

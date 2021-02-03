Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/schools', to: 'schools#index'
  get '/schools/new', to: 'schools#new'
  get '/schools/:id', to: 'schools#show'

  get '/dealers', to: 'dealers#index'
end

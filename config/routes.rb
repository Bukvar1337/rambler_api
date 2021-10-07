Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope '/api' do
    resources :tags
    resources :topics, except: [:show, :update]
    get '/topics/*urn', to: 'topics#show', format: false
    put '/topics/*urn', to: 'topics#update', format: false
    delete '/topics/*urn', to: 'topics#destroy', format: false
    resources :rubrics
  end
end

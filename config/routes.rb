Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      get '/cards', to: 'cards#index'
      get '/cards/:id', to: 'cards#show'

      get '/decks', to: 'decks#index'
      get '/decks/:id', to: 'decks#show'
      post '/decks', to: 'decks#create'
      put '/decks/:id', to: 'decks#update'

      get '/card_search', to: 'card_search#index'
      get '/deck_search', to: 'deck_search#index'

      get '/decks/:id/commanders', to: 'commanders#index'

    end
  end
end

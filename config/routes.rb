Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/card_search', to: 'card_search#index'
      get '/cards', to: 'cards#index'
      get '/cards/:id', to: 'cards#show'
    end
  end
end

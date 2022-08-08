Rails.application.routes.draw do
  get '/new', to: 'games#new', as: :new
end

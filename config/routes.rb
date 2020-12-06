Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'homes#create'
  get '/logout', to: 'homes#destroy'
  get 'twitter/lottery'
  get 'twitter/management'

  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'twitter/lottery'
  get 'twitter/management'
  get 'sessions/friendship'
  get 'sessions/finish'
  get 'sessions/again'


  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

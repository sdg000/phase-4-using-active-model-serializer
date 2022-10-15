Rails.application.routes.draw do
  resources :movies, only: [:index, :show]


  # BREAKING CONVENTIONS / NON RESTFUL ROUTES
#Create custom non-rest route to render custom serializer method
get "/movies/:id/summary", to: 'movies#summary'

#Create custom non-rest route to render custom serializer method
get "/movie-summaries", to: 'movies#summaries'

end

Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  #I don't understand how this works, I can't get errors to go away unless I name the 
  #function, the as argument, and the filename of the view to be the same thing
  #and the way rails changes function names makes all the syntax awful
  get 'sameDirector/:title', to: 'movies#search', as: 'search'
end

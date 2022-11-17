Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'lists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # lists index: A user can see all the lists
  # lists show: A user can see the details of a given list and its name
  # lists new and create: A user can create a new list

  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create] # preencher aqui o que for preciso
  end
  resources :bookmarks, only: %i[destroy]
end

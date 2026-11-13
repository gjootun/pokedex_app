Rails.application.routes.draw do
  # Home page is the Pokémon list
  root "pokemons#index"

  # Read-only pages for each collection (list + individual page)
  resources :pokemons, only: [:index, :show]
  resources :element_types, only: [:index, :show], path: "types"
  resources :trainers, only: [:index, :show]

  # Static about page
  get "about", to: "pages#about"
end

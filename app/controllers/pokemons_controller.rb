class PokemonsController < ApplicationController
  # List of Pokémon with search, type filter and pagination (20 per page)
  def index
    @element_types = ElementType.order(:name) # fills the dropdown in the search form
    @pokemons = Pokemon.search(params[:q], params[:element_type_id])
                       .order(:pokedex_number)
                       .page(params[:page]).per(20) # kaminari pagination
  end

  # Individual Pokémon page
  def show
    @pokemon = Pokemon.find(params[:id])
  end
end

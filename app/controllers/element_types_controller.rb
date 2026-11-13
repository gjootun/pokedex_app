class ElementTypesController < ApplicationController
  # List of all types
  def index
    @element_types = ElementType.order(:name)
  end

  # One type page, which lists every Pokémon of that type
  def show
    @element_type = ElementType.find(params[:id])
    @pokemons = @element_type.pokemons.order(:pokedex_number)
  end
end

class TrainersController < ApplicationController
  # List of all trainers
  def index
    @trainers = Trainer.order(:name)
  end

  # One trainer page, with their team
  def show
    @trainer = Trainer.find(params[:id])
    # includes(:pokemon) loads all the Pokémon in one query instead of one per row
    @team_members = @trainer.team_members.includes(:pokemon)
  end
end

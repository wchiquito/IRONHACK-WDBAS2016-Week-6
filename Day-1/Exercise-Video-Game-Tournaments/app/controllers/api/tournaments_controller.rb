class Api::TournamentsController < ApplicationController
  def index
    tournaments = Tournament.all
    render json: tournaments
  end

  def create
    tournament = Tournament.create tournament_params
    render json: tournament, status: :created
  end

  def destroy
    tournament = Tournament.find_by_id params[:id]
    if tournament.nil?
      render json: { error: "Tournament not found"}, status: 404
      return
    end
    tournament.destroy
    render json: tournament
  end

  private

  def tournament_params
    params.require(:tournament).permit :name
  end
end
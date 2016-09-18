class Api::V1::SandwichesController < ApplicationController
  def index
    sandwichs = Sandwich.all
    render json: sandwichs
  end

  def show
    sandwich = Sandwich.find_by id: params[:id]
    unless sandwich
      render json: {error: "sandwich not found"},
      status: 404
      return
    end
    render json: sandwich
  end

  def add_ingredient
    sandwich = Sandwich.find_by id: params[:sandwich_id]
    unless sandwich
      render json: { error: 'sandwich not found' },
                     status: 404
      return
    end
    ingredient = Ingredient.find_by id: params[:ingredient_id]
    unless ingredient
      render json: { error: 'ingredient not found' },
                     status: 404
      return
    end
    sandwich.ingredients.push ingredient
    render json: sandwich
  end
end
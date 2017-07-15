class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :destroy]

  def index
    @ingredients = Ingredient.all
    render json: @ingredients
  end

  def show
    render json: @ingredient
  end

  def destroy
    @ingredient.destroy
    head :no_content
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end

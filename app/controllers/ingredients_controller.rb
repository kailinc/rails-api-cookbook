class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :destroy, :update]

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

  def update
    if @ingredient.update(ingredient_param)
      head :no_content
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_param
    params.require(:ingredient).permit(:name, :unit)
  end
end

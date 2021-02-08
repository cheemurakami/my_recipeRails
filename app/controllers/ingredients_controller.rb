class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new(recipe_id: params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.ingredients.create(ingredients_params)
    redirect_to recipe_path(@recipe)
  end

  private
    def ingredients_params
      params.require(:ingredient).permit(:name, :measurement_unit, :measurement_qty, :recipe_id)
    end
end

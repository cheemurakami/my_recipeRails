class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  

  private
    def recipe_params
      params.require(:recipe).permit(:name, :category, :ingredients)
    end
end

class IngredientsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new(recipe_id: params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new(ingredients_params)
    if @ingredient.save
      redirect_to recipe_path(@recipe), notice: "Ingredient is successfully added!"
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    if  @ingredient.update(ingredients_params)
      redirect_to recipe_path(@recipe), notice: "Ingredient is successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
    @ingredient.destroy
    redirect_to recipe_path(@recipe), notice: "Ingredient is successfully deleted!"
  end

  private
    def ingredients_params
      params.require(:ingredient).permit(:name, :measurement_unit, :measurement_qty, :recipe_id)
    end
end

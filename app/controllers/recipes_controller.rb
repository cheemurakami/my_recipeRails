class RecipesController < ApplicationController
  def index
    if (params[:sort] == "atoz")
      @recipes = Recipe.all.order(Arel.sql('lower(name)'))
    else
      @recipes = Recipe.all.order(created_at: 'desc')
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: "Recipe was successfully created!"      
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if  @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :category)
    end
end

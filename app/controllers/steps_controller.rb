class StepsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.new(recipe_id: params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.new(step_params)
    if @step.save
      redirect_to recipe_path(@recipe), notice: "Step is successfully added!"
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.find(params[:id])
    if @step.update(step_params)
      redirect_to recipe_path(@recipe), notice: "Step is successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.find(params[:id])
    if @step.destroy
      redirect_to recipe_path(@recipe), notice: "Step is successfully deleted!"
    end
  end

  private
    def step_params
      params.require(:step).permit(:index, :description, :recipe_id)
    end
end

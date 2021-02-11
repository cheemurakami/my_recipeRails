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

  private
    def step_params
      params.require(:step).permit(:index, :description, :recipe_id)
    end
end

class StepsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.new(recipe_id: params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.find(params[:id])
  end

  private
    def step_params
      params.require(:step).permit(:index, :description)
    end
end

class ReviewsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(recipe_id: params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to recipe_path(@recipe), notice: "Review is successfully added!"
    else
      render 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:star, :comment, :recipe_id)
    end
end

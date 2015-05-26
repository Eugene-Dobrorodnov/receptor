class RecipesController < ApplicationController
  before_action :get_recipe, only: %i(show edit update destroy)

  def index
  end

  def show
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.steps.build}
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def get_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, steps_attributes: [:id, :title, :description])
  end
end

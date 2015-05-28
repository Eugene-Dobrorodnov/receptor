class RecipesController < ApplicationController
  before_action :get_recipe,         only: %i(show edit update destroy)
  before_action :authenticate_user!, only: %i(create new edit update destroy)

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    3.times { @recipe.steps.build}
  end

  def create
    @recipe = Recipe.create recipe_params
    @recipe.user = current_user
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @recipe.user = current_user
    if @recipe.update recipe_params
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_url
  end

  private
  def get_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, steps_attributes: [:id, :title, :description])
  end
end

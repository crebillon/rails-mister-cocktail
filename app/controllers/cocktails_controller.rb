class CocktailsController < ApplicationController
  def index
    if params[:query].present?
      @cocktails = Cocktail.where(name: params[:query])
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.all
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.create(cocktails_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name, :photo)
  end
end

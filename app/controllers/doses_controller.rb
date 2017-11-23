class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  def destroy
    @dose.delete
    redirect_to cocktail_path(@dose.cocktail)
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private
  def set_dose
    @dose = Dose.find(params[:id])
  end

  def doses_params
    params.require(:dose).permit(:description)
  end
end

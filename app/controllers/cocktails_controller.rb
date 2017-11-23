class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  # def destroy
  #   @cocktail.delete
  #   redirect_to cocktails_path
  # end

  def new
    @cocktail = Cocktail.new
  end

  def create
    # @flat = Flat.find(params[:flat_id])
    # @review = Review.new(review_params)
    # @review.flat = @flat
    # if @review.save
    #   redirect_to flat_new(@flat)
    # else
    #   render :new
    # end
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end

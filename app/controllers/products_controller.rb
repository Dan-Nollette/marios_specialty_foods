class ProductsController < ApplicationController

  def index
    @products = Product.all.highest_cost_first
    @mostReviewedProducts = @products.most_reviews
    @newestProducts = @products.recently_added
  end

  def new
    @tmp = 0.0
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @tmp =  @product.cost_in_usa_cents.to_f / 100
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

private
  def product_params
    unless params["product"]["cost_in_usa_cents"] == ""
      actual_cents = 100 * params["product"]["cost_in_usa_cents"].to_f
      params["product"]["cost_in_usa_cents"]= actual_cents
    end
    params.require(:product).permit(:name, :cost_in_usa_cents, :country_of_origin)
  end
end

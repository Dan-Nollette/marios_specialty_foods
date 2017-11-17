class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    tmp = Product.find(params[:id])
    tmp.cost_in_usa_cents =  tmp.cost_in_usa_cents / 100.0
    @product = tmp
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
    actual_cents = 100 * params["product"]["cost_in_usa_cents"].to_f
    params["product"]["cost_in_usa_cents"]= actual_cents
    params.require(:product).permit(:name, :cost_in_usa_cents, :country_of_origin)
  end
end

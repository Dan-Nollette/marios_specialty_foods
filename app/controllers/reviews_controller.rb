class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@review.product)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
  end

  def update
    @review= Review.find(params[:id])
    @product = Product.find(params[:product_id])
    puts(@product.id.to_s)
    if @review.update(review_params)
      redirect_to products_path(@product)
    else
      render :edit
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @product = Product.find(@review.product_id)
    @review.destroy
    redirect_to product_path(@review.product)
  end

  def index
    @review = Review.all
  end

private

  def review_params
    params.require(:review).permit(:content_body, :author, :rating)
  end

end

class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @new_review = Review.new

     @sorted_reviews = @product.reviews.order(created_at: :desc)
  end

end

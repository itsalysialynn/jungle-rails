class ReviewsController < ApplicationController

   before_action :login_required

  def login_required
    redirect_to '/login' unless current_user
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id

    if @review.save
      redirect_to @review.product, notice: 'Review was successfully created.'  
    else
      p @review.errors
      redirect_to @review.product, notice: 'Failed to create the review'
    end
  end

  def destroy 
    @product = Product.find (params[:product_id])
    @reviewed = Review.find (params[:id])
    @reviewed.destroy
    redirect_to @product, notice: 'Review was successfully deleted.'  
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
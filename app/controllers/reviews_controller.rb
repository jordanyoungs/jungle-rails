class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find_by(id: params.require(:product_id))
    review = @product.reviews.new(review_params)

    review.user = current_user unless current_user.nil?

    if review.save
      flash[:success] = "Thanks for the Review!"
      @product.update(average_rating: @product.reviews.average(:rating).round(1))
      redirect_to @product
    else
      review.errors.full_messages.each do |msg|
        flash.now[:danger] ||= []
        flash.now[:danger] << msg
      end
      render 'products/show'
    end

  end

  def destroy
    product = Product.find_by(id: params.require(:product_id))
    review = product.reviews.find_by(id: params.require(:id))
    if review.destroy
      product.update(average_rating: product.reviews.average(:rating).round(1))
      flash[:warning] = "Review deleted"
      redirect_to product
    else
      review.errors.full_messages.each do |msg|
        flash.now[:danger] ||= []
        flash.now[:danger] << msg
      end
      render 'products/show'
    end

  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end

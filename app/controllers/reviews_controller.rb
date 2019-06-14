class ReviewsController < ApplicationController
  before_filter :require_login  
  def create
        product = Product.find(params[:product_id])
        review = Review.new(review_params)
        review.product = product
        review.user = current_user
        review.save
       
          redirect_to "/products/#{params[:product_id]}/"
        
      end

      def destroy
        review = Review.find params[:id]
        review.destroy
        redirect_to "/products/#{params[:product_id]}/"
      end
    private
      def review_params
        params.require(:review).permit(:description, :rating)
      end
      def require_login
      end
end

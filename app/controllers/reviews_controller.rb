class ReviewsController < ApplicationController

before_action :authenticate_user!, only: [:create]

	def index
		@review=Review.all
	end
	





	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		if user_signed_in?
		if @review.save

			 redirect_to :back
			
			end
		end
	end

	def show
		@review = Review.where('user_id = ?',current_user.id)
	end

		def destroy
			@review = Review.find(params[:id])  
			if @review.destroy
				 redirect_to :back
			end
        end



        private

		def review_params
			params[:review].permit( :product_id, :title, :body,:user_id)
		end


end

class ReviewsController < ApplicationController
    before_action :authenticate_user!, only:[:create, :destroy]

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            flash[:notice] = "口コミ書いたよ。"
            redirect_to root_url
        else
            render 'sratic_pages/home'
        end
    end

    def destroy
    end

    private

        def review_params
            params.require(:review).permit(:content)
        end
end

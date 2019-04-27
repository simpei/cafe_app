class ReviewsController < ApplicationController
    before_action :authenticate_user!, only:[:create, :destroy]
    before_action :correct_user,       only: :destroy

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            flash[:notice] = "口コミ書いたよ。"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end

    def destroy
        @review.destroy
        flash[:success] = "口コミを削除しました！"
        redirect_to request.referrer || root_url
    end

    private

        def review_params
            params.require(:review).permit(:content, :picture)
        end

        def correct_user
            @review = current_user.reviews.find_by(id: params[:id])
            redirect_to root_url if @review.nil?
        end
end

class StaticPagesController < ApplicationController
 before_action :sign_in_required, only: [:show]
  def home
    @review = current_user.reviews.build if user_signed_in?
  end

  def about
  end

  def serch
  end

  def contact
  end
end

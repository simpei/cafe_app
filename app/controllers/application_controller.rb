class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resources)
    user_path(@user)
  end

  private
    def sign_in_required
      redirect_to_new_user_session_url unless user signed_in?
    end

    # def logged_in_user
    #   unless user_signed_in?
    #     store_location
    #     flash[:danger] = "ログインしてください。"
    #     redirect_to root_url
    #   end
    # end

end
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # beforeフィルター

  # 正しいユーザーかどうかを確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # 管理者かどうかを確認
  #def admin_user
    #redirect_to(root_url) unless current_user.admin?
  #end
end

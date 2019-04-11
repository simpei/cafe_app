class StaticPagesController < ApplicationController
 before_action :sign_in_required, only: [:show]
  def home
  end

  def about
  end

  def serch
  end

  def contact
  end
end

class HomeController < ApplicationController
  def index
    unless current_user.nil?
      redirect_to user_path(current_user)
    end
  end
end

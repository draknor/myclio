class HomeController < ApplicationController
  around_filter :user_time_zone, :if => :current_user

  def index
    @users = User.all
  end
end

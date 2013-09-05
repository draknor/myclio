class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  # This is a thread-safe way to use time zone. See http://www.elabs.se/blog/36-working-with-time-zones-in-ruby-on-rails
  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

end

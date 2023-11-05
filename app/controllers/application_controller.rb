class ApplicationController < ActionController::Base
  before_action :identify_user

  def identify_user
    set_user unless cookies.key?(:user_id)
  end

  def set_user
    cookies[:user_id] = SecureRandom.uuid
  end

  def current_user
    cookies[:user_id]
  end
  helper_method :current_user
end

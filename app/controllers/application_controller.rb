class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_action :authenticate_user!

	layout :layout_by_resource

  private
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end

  def layout_by_resource
    if devise_controller?
      "empty"
    else
      "application"
    end
  end
end

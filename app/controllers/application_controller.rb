class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    unless current_user.nil?
      controller = params[:controller]
      action = params[:action]

      if !Rails.application.config.permissions[current_user.role][controller.to_sym].include?(action)
        flash[:error] = "Ooops. Not allowed."
        redirect_to root_path
      end
    end
  end

end

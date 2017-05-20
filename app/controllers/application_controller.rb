# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_params, if: :devise_controller?

  def authorize
    unless current_user.nil?
      controller = params[:controller]
      action = params[:action]

      unless Rails.application.config.permissions[current_user.role][controller.to_sym].include?(action)
        flash[:error] = "Sorry, you don't have permission to do that. ¯\\_(ツ)_/¯"
        redirect_to root_path
      end
    end
  end

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role first_name last_name experience])
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :current_admin_user
  check_authorization unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to products_path, alert: exception.message
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to products_path, alert: exception.message
  end

  class ActiveAdmin::BaseController
    skip_before_action :authenticate_user!, raise: false
    skip_authorization_check
  end

  def current_ability
    @current_ability ||= current_user&.ability
  end
end

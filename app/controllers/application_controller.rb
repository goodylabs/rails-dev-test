class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :current_admin_user
  check_authorization unless: :devise_controller?

  class ActiveAdmin::BaseController
    skip_before_action :authenticate_user!, raise: false
    skip_authorization_check
  end

  def current_ability
    @current_ability ||= current_user&.ability
  end
end

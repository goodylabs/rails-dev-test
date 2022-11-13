class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  check_authorization unless: :devise_controller?

  def current_ability
    @current_ability ||= current_user&.ability
  end
end

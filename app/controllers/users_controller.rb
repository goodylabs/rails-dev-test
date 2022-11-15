class UsersController < ApplicationController
  load_and_authorize_resource

  private
  
  def user_params
    params.require(:user).permit(
      :email, 
      :first_name, 
      :last_name, 
      :address, 
      :credit_card
    )
  end
  
end

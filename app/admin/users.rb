ActiveAdmin.register User do
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :role
  permit_params :email, :password, :password_confirmation, :name, :surname, :address, :credit_card, :role

  filter :email
  filter :name
  filter :role
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :surname
    column :address
    column :credit_card
    column :role
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :surname
      f.input :address
      f.input :credit_card
      f.input :role, :collection => options_for_select(['admin','moderator','user'])

    end
    f.actions
  end
end

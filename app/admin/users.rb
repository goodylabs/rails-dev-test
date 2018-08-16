ActiveAdmin.register User do

  filter :email

  actions :index, :show

  index do
    column :email
    column 'No orders' do |u|
      u.orders.count if u.orders
    end
    column :last_sign_in_at do |u|
      u.last_sign_in_at.strftime('%F %T')
    end
    column :created_at do |u|
      u.created_at.strftime('%F %T')
    end
    actions
  end

  show do
    panel 'Details' do
      attributes_table_for user do
        row :email
        row :current_sign_in_at
        row :last_sign_in_at
        row :updated_at
        row :created_at
      end
    end
    panel 'Orders' do
      table_for user.orders do
        column :id
        column :address
        column :total_price
        column :created_at do |u|
          u.created_at.strftime('%F %T')
        end
      end
    end
  end
end

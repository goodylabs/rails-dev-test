ActiveAdmin.register Order do

  filter :id

  actions :index, :show

  index do
    column :id
    column 'User' do |o|
      o.user.email
    end
    column :email
    column :total_price do |o|
      number_to_currency(o.total_price, precision: 2)
    end
    column :created_at do |o|
      o.created_at.strftime('%F %T')
    end
    actions
  end

  show do
    panel 'Details' do
      attributes_table_for order do
        row :id
        row :email
        row :address
        row :total_price do |o|
          number_to_currency(o.total_price, precision: 2)
        end
        row :created_at do |o|
          o.created_at.strftime('%F %T')
        end
      end
    end
    panel 'Products' do
      table_for order.order_products do
        column 'Name' do |o|
          o.product.nil? ? 'Not found' : o.product.name
        end
        column :quantity
        column :price do |o|
          number_to_currency(o.price, precision: 2)
        end
      end
    end
  end

end

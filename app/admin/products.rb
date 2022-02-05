# frozen_string_literal: true

ActiveAdmin.register Product do
  index do
    column :id
    column :name
    column :price_cents do |product|
      humanized_money_with_symbol product.price
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :price_cents do |product|
        humanized_money_with_symbol product.price
      end
      row :created_at
      row :updated_at
    end
  end

  permit_params do
    permitted = %i[name price_cents price_currency]
    permitted << :other if params[:action] == 'create'
    permitted
  end
end

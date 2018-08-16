ActiveAdmin.register Product do

  permit_params :name, :price, :quantity, :image

  filter :name

  index do
    column :image do |p|
      image_tag(p.image.url(:thumb)) + '</a></div>'.html_safe if p.image?
    end
    column :name
    column :price do |p|
      number_to_currency(p.price, precision: 2)
    end
    column :quantity do |p|
      p.quantity > 0 ? p.quantity : 'Out of stock'
    end
    column :created_at do |p|
      p.created_at.strftime('%F %T')
    end
    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :price
      f.input :quantity
      f.input :image, as: :file, :hint => (f.template.image_tag(f.object.image.url(:thumb)) if f.object.image.exists?)
    end
    f.actions
  end

end

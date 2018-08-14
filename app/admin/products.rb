ActiveAdmin.register Product do

  permit_params :name, :price, :quantity, :image

  filter :name

  index do
    column :image do |p|
      image_tag(p.image.url(:thumb)) + '</a></div>'.html_safe if p.image?
    end
    column :name
    column :price
    column :quantity
    column :created_at
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

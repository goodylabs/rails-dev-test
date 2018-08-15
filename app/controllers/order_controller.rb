class OrderController < FrontendController
  def basket
    cookies_products = cookies[:products]
    @products = []
    if cookies_products
      @products = JSON.parse(cookies_products)
      @total_price = @products.map {|p| (p['price'].to_f * p['quantity'])}.sum
    end
  end

  def checkout
    #get cookie
    cookies_products = cookies[:products]
    @products = []
    if cookies_products
      #parse cookie
      @products = JSON.parse(cookies_products)
      #map products ids
      cookies_products_ids = @products.map {|p| p['id']}
      #total price
      @total_price = @products.map {|p| (p['price'].to_f * p['quantity'])}.sum
      #get products from db by ids
      database_products = Product.where(:id => cookies_products_ids)
      #error notification
      error_notification = []

      if database_products
        #prepare objects to compare
        database_products_informations = database_products.map {|p| {id: p.id, quantity: p.quantity, name: p.name, price: p.price}}

        #check availability
        @products.each do |p|
          product = database_products_informations.select { |d| d[:id] == p['id'].to_i }
          if product.any?
            if product.first[:quantity] < p['quantity'].to_i
              error_notification << '<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>' + product.first[:name].to_s + ' only <strong>' + product.first[:quantity].to_s + '</strong> in stock.'
            end
            if product.first[:price] != p['price'].to_f
              error_notification << '<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>Price of ' + product.first[:name].to_s + ' has been changed. Please remove and add it again.'
            end
          else
            #product not found in db
            error_notification << '<i class="fa fa-remove" aria-hidden="true"></i>' + p['name'].to_s + ' is currently unavailable. Please remove it from basket.'
          end
        end

      end
      puts error_notification
      if error_notification.any?
        redirect_to basket_path, :alert => error_notification.join('</br>')
      end

    else
      redirect_to root_path, :alert => 'Add some products to your basket'
    end
  end
end
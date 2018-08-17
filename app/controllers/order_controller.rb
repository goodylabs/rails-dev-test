class OrderController < FrontendController

  def show
    @orders = current_user.orders
  end

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

  def create
    #get products from cookies
    cookies_products = cookies[:products]

    if cookies_products

      #parse products
      products = JSON.parse(cookies_products)
      #total price
      total_price = products.map {|p| (p['price'].to_f * p['quantity'])}.sum

      #new order
      order = Order.new(order_params)
      #set user_id
      order.user_id = current_user.id
      #set total_price
      order.total_price = total_price

      #prepare order_products in loop
      all_products = []
      products.each do |p|
        product = {
            order_id: order.id,
            product_id: p['id'],
            quantity: p['quantity'],
            price: p['price']
        }
        all_products << product
      end

      order.order_products_attributes = all_products

      if order.save

        #update products quantity
        products.each do |p|
          product_to_update = Product.find(p['id'])
          puts product_to_update
          product_to_update.decrement!(:quantity, p['quantity'])
        end

        #clear cookies
        cookies.delete :products

        redirect_to root_path, :notice => 'Order has been registered.'
      else
        redirect_to checkout_path, :alert => order.errors.full_messages.join('</br>')
      end
    else
      redirect_to checkout_path, :alert => 'Ooops! Something went wrong. Please try again'
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :email, :address, :order_products => [:id, :order_id, :product_id, :quantity, :price]);
  end
end
# Getting started

1. `bundle install`
2. `rake db:create`
3. `rake db:migrate`
4. `rake db:seed`
5. `rails s`

# Run tests
`bundle exec rspec`

# My notes and assumptions
1. There wasn't note about user in requirements so the application is created userless, it could be easily changed by adding devise, pundit and stuff like that.
2. I assumed that the checkout system should be build from the ground and we shouldn't use stripe.
3. Requirements have not specifed how we should validate credit cards number so i have not use the Luhn algorithm to do that in seperate validator and instead I am just checking the presence of it. 
4. Whole structure looks like this :
- Product: Represents a product that can be bought.
- Cart: Represents a shopping cart that stores products that the user wants to buy.
- Line Item: Represents a specific product that has been added to the cart, including its quantity and total price.
- Order: Represents a completed purchase, including information about the user, the products bought, and the payment method.
# ApplicationController
The ApplicationController has a current_cart method that sets the @current_cart instance variable to the current Cart associated with the session[:cart_id]. If there is no current Cart, it creates one and sets session[:cart_id] to the new Cart's id. </br>
# CartsController
The CartsController has a show method that sets the @cart instance variable to the current Cart associated with the session[:cart_id]. The destroy method destroys the current Cart, sets session[:cart_id] to nil, and redirects to the root path. </br>
# LineItemsController
The LineItemsController has a create method that finds the chosen Product and the current Cart. If the current Cart already includes the chosen Product, it finds the LineItem associated with the Product and increments its quantity by 1. Otherwise, it creates a new LineItem with a quantity of 1, associates it with the Product and the current Cart, and saves it. The destroy method finds the LineItem with the specified id, destroys it, and redirects to the cart path. The add_quantity and reduce_quantity methods find the LineItem with the specified id, respectively increment and decrement its quantity (if possible), and save it. </br>
# OrdersController
The OrdersController has an index method that sets the @orders instance variable to all existing Orders, a show method that finds the Order with the specified id and sets the @order instance variable to it, a new method that sets the @order instance variable to a new Order, and a create method that creates a new Order with the specified order_params. It then adds all LineItems associated with the current Cart to the new Order, sets their cart_id to nil, and saves them. If the Order saves successfully, it destroys the current Cart, sets session[:cart_id] to nil, and redirects to the new Order. Otherwise, it renders the new template.</br>
# ProductsController
Here we have just simple CRUD


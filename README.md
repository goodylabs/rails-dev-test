# Getting started

1. `bundle install`
2. `rake db:create`
3. `rake db:seed`
4. `rails s`

# The goal

The goal of the exercise is to create a checkout system that fulfills the criteria listed below:
1. Products can be added to a basket
2. Products can be removed from a basket
3. Basket can be checked out - a total price is calculated
4. Customer’s Email, Address and Credit card details are required to check out
5. Customers will have an Order after checking out that contains all the basket items
6. Products can be managed from ActiveAdmin (https://github.com/activeadmin/activeadmin) or RailsAdmin (https://github.com/sferik/rails_admin)
7. Products should have at least a name and a price
8. Products can be bought more than once
    
# Deliverables :
- Create a database that can support the criteria
- Create pages to accommodate functionality
- Validation of intended functionality
- Brief written summary of approach, assumptions, caveats and notes
- Instructions on how to run the project
- Submission should be a GitHub repository
- RSpec tests 
 
 Note: 
- No attention will be paid to the look and feel of this task. Pages can be plain HTML.

----------

About:

Products are created by the admin and should have fields such as: name, quantity, price.
A user should have account in order to buy products (in other case user can't buy anything).
Only products in stock (quantity > 0) are visible for user.
On client side, products are stored in cookie for 1 day.
If the user creates an order or is logged out cookie is cleared.
Before being redirected to checkout page, quantity of every product in basket should be checked.
If the user tries to order more than we have on stock, there would be an error message.
Before creating order a form is validated
After order create quantity of ordered products are updated
Signed in users have "Orders" subpage and can check all their orders
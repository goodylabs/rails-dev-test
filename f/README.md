#About the application
Thanks to the application I wrote, we can easily add products to the cart. First, users should log in and, if they are new, register - by default, they are assigned the "user" role. If the user has the role "user", he can add products to the cart and view them. If the user has the role of "admin", he can add products to the cart, view products and add new products.
Appropriate messages are displayed on the page, both about errors and about the correct execution of the operation. The application has separate forms for registration and login (I used gem devise), as a non-logged in user we have access to the home page - we can view items and display detailed information about them in a new view. Adding a product takes place on the home page, first we search for the product we are interested in and then select the quantity that interests us, after adding it, we can go to the basket where we can change the quantity that interests us, remove the product or products. The total price is displayed in the shopping cart. In the application I used pagination, thanks to which maximum 6 products are displayed on the page, they are sorted alphabetically by name. Also, ActiveAdmin panel was installed, with which we can easily manage data about products or users.
I created my first tests for models: Product and Users with rspec gem. 

-----The setups steps expect following tools installed on the system-----
*Git
*Rails atleast 5.2.4.6 
*Ruby 2.5.2 (used)
*Mysql 

#Installation and first run
1. Download the repository
git clone https://github.com/goodylabs/rails-dev-test.git 
or
git clone -b michal_cart https://github.com/goodylabs/rails-dev-test.git 

2. Install gems
bundle install

3. Run the following commands to create and setup the database.
rails db:create | rake db:create
rails db:migrate | rake db:migrate
rails db:seeds | rake db:setup

4. Start the Rails server
You can start the rails server using the command given below.
rails s

And now you can visit the site with the URL http://localhost:3000
As I promised:
-login for admin: admin@example.com password
-login for default user: 1. register or use: michal@example.com password

5*. Test running
bundle exec rspec spec/models/user_spec.rb
bundle exec rspec spec/models/product_spec.rb


Michał Kasperek


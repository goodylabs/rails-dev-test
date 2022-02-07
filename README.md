![Goodylabs_logo](https://user-images.githubusercontent.com/1035770/151546790-59ffd0b3-3caa-4ecd-918b-cecfcfdfcccb.png)

# Welcome

👋 Hey there! If you got here, it means you've decided to accept our little test assignment. That's great! We're really happy to see you here. We hope you'll find this  easy and will 🚀 blaze through it in minutes 😀 If you do we'd love to welcome you to our team of true motherhackers.

Good Luck!

# Simple RoR test for candidates

This repository holds a pretty basic Rails 5 app. A candidate applying to goodylabs is asked to fork this repo and submit a PR once they're done with the assignment.

# Getting started

1. `bundle install`
2. `rake db:create`
3. `rails s`

# The goal

The goal of the exercise is to create a checkout system that meets the requirements listed below:

1. Products can be added to the Cart
2. Products can be removed from the Cart
3. A Cart can be checked out - a total price is calculated
4. A Customer’s Email, Address and Credit Card details are required to check out
5. After checking out, the Customer will have an Order that contains all the cart items
6. Products can be managed from ActiveAdmin (https://github.com/activeadmin/activeadmin) or RailsAdmin (https://github.com/sferik/rails_admin)
7. Products should have at least a name and a price
8. Products can be bought more than once
    
# Deliverables
- Create a database that can support the requirements listed above 
- Create pages to accommodate the required functionality
- Validation of intended functionality
- Brief summary of your approach, assumptions, caveats and notes (in a form of a README.md)
- Instructions on how to run the project
- Submission should be a GitHub repository
- RSpec tests 
 
 Note: 
- No attention will be paid to the look and feel of this task. Pages can be plain HTML.


----------
# Solution

## Getting started
### DB credentials
- credentials are stored in `config/credentials.yml.enc`
- do in your terminal `EDITOR={your_editor} rails credentials:edit` to provide credentials, i.e. do `EDITOR=nano rails credentials:edit` if your editor is nano

## Assumptions & Changes
- PostgreSQL instead of MySQL (i did not want to install MySql on my local env ;) )
- Admin users, user authorization and authenticaton are in scope of this task (can be added later). 
- As we do not have users - there is no association between Cart and its owner. it si why `identifier` attribute is used to distinguish carts
- Cart is created when customer adds first product (we should track in future abandoned carts) and is not deleted immediatelly after user removes all products. 
- Order gets created after successful checkout process
- OrderItems are missing :(

- architecture based on Interactor patter


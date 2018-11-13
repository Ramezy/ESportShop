# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

#adminUser = Admin.create( :name => "Aramide", :address => "295 Princess Street")

#customerUser = Customer.create( :name => "Jack Missga", :address => "160 Princess Street")

#order = Order.create( :status => "Processing", :admin => adminUser, :cost => 20, :quantity => 5)

#product = Product.create( :productCost => 24, :productName => "Paul Pogba Jersey", :productSize => "L", :productStyle => "Shirts", :productType => "Shirt", :productImage => "", :productDescription => "A number 6 shirt")

#product_Order = OrderProduct.create( product, order, :quantity => 25)
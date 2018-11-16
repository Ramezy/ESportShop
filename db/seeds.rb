require 'json'

file = File.read("sport.json")
data = JSON.parse(file)

customerUser = Customer.create( :name => "Jack Missga", :address => "160 Princess Street")

adminUser = Admin.( :name => "Aramide", :address => "295 Princess Street")

order = Order.create( :status => "Processing", :admin => adminUser, :cost => 20, :quantity => 5)

data.each do |cleat|
    pro = product.create(productCost: cleat["cost"], productName: cleat["name"], productSize: cleat["size"], productDescription: cleat["description"])

    pro_order = ProductOrder.create(pro, order, pro["quantity"])
end


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?







#product = Product.create( :productCost => 24, :productName => "Paul Pogba Jersey", :productSize => "L", :productStyle => "Shirts", :productType => "Shirt", :productImage => "", :productDescription => "A number 6 shirt")

#product_Order = OrderProduct.create( product, order, :quantity => 25)
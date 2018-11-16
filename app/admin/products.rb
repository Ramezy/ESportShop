ActiveAdmin.register Product do
    permit_params :productName, :productCost, :productSize, :productDescription
end

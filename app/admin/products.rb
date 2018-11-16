ActiveAdmin.register Product do
    permit_params :name, :productCost, :productSize, :productDescription
end

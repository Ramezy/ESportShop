ActiveAdmin.register Product do
    permit_params :productName, :productCost, :productSize, :productDescription, :productStyle, :productType, :productImage, :category_id, :deal_id
end

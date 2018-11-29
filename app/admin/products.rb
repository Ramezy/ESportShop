ActiveAdmin.register Product do
    permit_params :productName, :productCost, :productSize, :productDescription, :productStyle, :productType, :productImage, :stock, :is_available, :category_id, :deal_id
end

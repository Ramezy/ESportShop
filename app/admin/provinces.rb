ActiveAdmin.register Province do
    permit_params :name, :province_abbr, :gst, :pst, :hst

end

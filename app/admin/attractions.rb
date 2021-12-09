ActiveAdmin.register Attraction do

 permit_params :attraction_name, :attraction_location, :attraction_description, :attraction_image, :status_id, :phone_number, :email_address, :hours_of_operation, :cost_of_entry, :attraction_category_id

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

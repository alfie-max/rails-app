ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :email
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :id
    column :name
    column :email

    actions
  end

  filter :email
  filter :name

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
    end

    f.actions
  end
end

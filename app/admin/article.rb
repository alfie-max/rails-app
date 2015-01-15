ActiveAdmin.register Article do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  index do
    column :title
    column :content
    column :article_user_name
    actions
  end

  filter :title
  filter :user, as: :select, :collection => proc { User.all }, label: 'Author'
end

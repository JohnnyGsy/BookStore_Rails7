ActiveAdmin.register Author do
  decorate_with AuthorDecorator
  permit_params :first_name, :last_name, :description

  index do
    selectable_column
    column :first_name
    column :last_name
    column :description
    actions
  end
end

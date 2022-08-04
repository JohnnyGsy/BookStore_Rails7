ActiveAdmin.register Book do
  decorate_with BookDecorator
  permit_params :title, :price, :description, :year_of_publication,
                :width, :height, :depth, :title_image,
                :materials, :category_id, author_ids: [], images: []

  index do
    selectable_column
    column :title_image do |book|
      image_tag book.title_image if book.title_image.attached?
    end
    column :title do |book|
      link_to book.title, resource_path(book)
    end
    column :short_description
    column :authors_names
    column :category
    column :price
    actions
  end

  show do
    attributes_table do
      row :title_image do |book|
        image_tag book.title_image if book.title_image.attached?
      end
      book.images.each do |image|
        row :image do
          image_tag image
        end
      end
      row :title
      row :price
      row :quantity
      row :authors, &:authors_names
      row :description
      row :year_of_publication
      row :category
      row :height
      row :width
      row :depth
      row :materials
    end
  end

  form(html: { multipart: true }) do |f|
    f.inputs do
      f.input :category
      f.input :title
      f.input :authors, collection: Author.all.decorate.map { |author| [author.full_name, author.id] }, as: :check_boxes
      f.input :description
      f.input :price
      f.input :year_of_publication
      f.input :height
      f.input :width
      f.input :depth
      f.input :materials
      f.input :title_image, as: :file
      f.input :images, as: :file, input_html: { multiple: true }
    end
    actions
  end
end

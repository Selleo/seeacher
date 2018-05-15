ActiveAdmin.register Level do
  permit_params :image, :word_id

  form multipart: true do |f|
    f.semantic_errors
    f.inputs do
      f.input :image, as: :file
    end

    f.actions
  end

  index do
    column :image do |img|
      link_to img.image.url do
        image_tag(img.image.url, size: '32')
      end
    end
    column :created_at
    column :updated_at
    actions
  end
end

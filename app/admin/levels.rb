ActiveAdmin.register Level do
  permit_params :image, :word_id, :order

  form multipart: true do |f|
    f.semantic_errors
    f.inputs do
      f.input :image, as: :file
      f.input :order
    end
    f.actions
  end

  index do
    column :id
    column :image do |level|
      link_to level.image.url do
        image_tag(level.image.url(:thumb))
      end
    end
    column :order
    column :created_at
    column :updated_at
    actions
  end
end

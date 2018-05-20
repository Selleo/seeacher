ActiveAdmin.register Word do
  permit_params :content, :level_id, :order

  form multipart: true do |f|
    f.semantic_errors
    f.inputs do
      f.input :level, collection: Level.pluck(:id), label: 'Level Id'
      f.input :content
    end
    f.actions
  end
end

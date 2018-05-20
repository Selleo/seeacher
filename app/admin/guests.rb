ActiveAdmin.register Guest do
  permit_params :image, :word_id

  form multipart: true do |f|
    f.semantic_errors
    f.inputs do
      f.input :word, collection: Word.all.map { |word| [word.content, word.id] }
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    column :id
    column :image do |guest|
      link_to guest.image.url do
        image_tag(guest.image.url(:thumb))
      end
    end
    column :created_at
    column :updated_at
    column 'Word Id' do |guest|
      guest.word.id
    end
    column 'Word content', label: 'asdfasd' do |guest|
      guest.word.content
    end
    actions
  end
end

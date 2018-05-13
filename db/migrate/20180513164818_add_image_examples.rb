class AddImageExamples < ActiveRecord::Migration[5.1]
  def change
    create_table :image_examples
    add_attachment :image_examples, :image
  end
end

class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.references :word, foreign_key: true

      t.timestamps
    end
    add_attachment :guests, :image
  end
end

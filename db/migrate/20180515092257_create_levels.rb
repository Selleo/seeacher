class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels, &:timestamps
    add_attachment :levels, :image
  end
end

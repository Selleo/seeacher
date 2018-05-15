class CreateUserLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :user_levels do |t|
      t.integer :passed
      t.references :user, foreign_key: true
      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end

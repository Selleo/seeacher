class AddLevelReferenceToWords < ActiveRecord::Migration[5.1]
  def change
    add_reference :words, :level, foreign_key: true
  end
end

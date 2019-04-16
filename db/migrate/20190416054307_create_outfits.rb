class CreateOutfits < ActiveRecord::Migration[5.2]
  def change
    create_table :outfits do |t|
      t.references :weather, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :high_temp
      t.date :date

      t.timestamps
    end
  end
end

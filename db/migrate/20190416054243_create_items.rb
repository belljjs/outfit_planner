class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :count
      t.integer :purchase_year
      t.references :user, foreign_key: true
      t.references :color, foreign_key: true
      t.references :season, foreign_key: true
      t.references :category, foreign_key: true
      t.references :occasion, foreign_key: true

      t.timestamps
    end
  end
end

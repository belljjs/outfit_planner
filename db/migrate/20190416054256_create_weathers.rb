class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.string :description
      t.string :icon_src
      t.string :name
      t.integer :icon
      t.integer :high_temp
      t.integer :low_temp
      t.date :date

      t.timestamps
    end
  end
end

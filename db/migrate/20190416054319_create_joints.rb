class CreateJoints < ActiveRecord::Migration[5.2]
  def change
    create_table :joints do |t|
      t.references :outfit, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end

class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name, null: false
      t.string :variant
      t.string :unit_type, null: false
      t.integer :mul_id, null: false

      t.timestamps
    end
  end
end

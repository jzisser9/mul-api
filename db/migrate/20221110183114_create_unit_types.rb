class CreateUnitTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_types do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_belongs_to :units, :unit_type
  end
end

class CreateCareTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :care_types do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end

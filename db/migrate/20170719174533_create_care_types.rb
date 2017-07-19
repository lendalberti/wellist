class CreateCareTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :care_types do |t|
      t.string :name
    end
  end
end

class CreateCareSubTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :care_sub_types do |t|
      t.string :name
    end
  end
end

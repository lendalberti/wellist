class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.string  :name, null: false
      t.integer :category_id, null: false
      t.integer :care_type_id, null: false
      t.integer :care_sub_type_id, null: false
      t.string  :address, null: false
      t.string  :city, null: false
      t.string  :state, null: false
      t.string  :zip, null: false
      t.integer :price_rating, null: false

      t.timestamps
    end

    add_foreign_key :vendors, :care_types,     on_delete: :cascade
    add_foreign_key :vendors, :care_sub_types, on_delete: :cascade
    add_foreign_key :vendors, :categories,     on_delete: :cascade

  end
end

class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string  :name
      t.integer :category_id
      t.integer :care_type_id
      t.integer :care_sub_type_id
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :zip
      t.integer :price_rating
    end

    add_foreign_key :vendors, :care_types,     on_delete: :cascade
    add_foreign_key :vendors, :care_sub_types, on_delete: :cascade
    add_foreign_key :vendors, :categories,     on_delete: :cascade

  end
end

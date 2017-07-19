class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :email
      t.integer :care_type_id
      t.string  :care_sub_type_id
    end

    add_foreign_key :users, :care_types,     on_delete: :cascade
    add_foreign_key :users, :care_sub_types, on_delete: :cascade

  end
end

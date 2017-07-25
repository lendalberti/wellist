class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :fullname, null: false
      t.string  :email, null: false
      t.integer  :care_type_id, null: false
      t.integer  :care_sub_type_id, null: false

      t.timestamps
    end

    add_foreign_key :users, :care_types,     on_delete: :cascade
    add_foreign_key :users, :care_sub_types, on_delete: :cascade

  end
end

class CreateWellist < ActiveRecord::Migration[5.0]
  def change
    create_table :wellists do |t|
      t.integer :user_id, null: false
      t.integer :vendor_id, null: false
      t.boolean :public_list, default: true
      t.boolean :public_vendor, default: true

      t.timestamps
    end

    add_foreign_key :wellists, :users,   on_delete: :cascade
    add_foreign_key :wellists, :vendors, on_delete: :cascade
  end
end

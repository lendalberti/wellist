class CreateWellist < ActiveRecord::Migration[5.1]
  def change
    create_table :wellists do |t|
      t.integer :user_id
      t.integer :vendor_id
    end

    add_foreign_key :wellists, :users,   on_delete: :cascade
    add_foreign_key :wellists, :vendors, on_delete: :cascade
  end
end

class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_pictures, :string, array: true, default: [], null: true
    add_column :users, :nickname, :string, null: true
    add_column :users, :favorite_verse, :string, null: true
    add_column :users, :email, :string, null: true
  end
end

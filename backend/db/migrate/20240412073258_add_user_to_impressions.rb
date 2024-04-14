class AddUserToImpressions < ActiveRecord::Migration[7.1]
  def change
    add_column :impressions, :user, :int
  end
end

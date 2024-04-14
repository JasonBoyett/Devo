class ChangeScripturesFieldInDevotionals < ActiveRecord::Migration[7.1]
  def change
    change_column :devotionals, :scriptures, :text, array: true, default: [], null: true
  end
end

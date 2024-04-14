class CreateDevotionals < ActiveRecord::Migration[7.1]
  def change
    create_table :devotionals do |t|
      t.string :title
      t.string :scriptures, array: true, default: [], null: false
      t.text :body
      t.boolean :is_markdown
      t.boolean :is_publuic
      t.string :template
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

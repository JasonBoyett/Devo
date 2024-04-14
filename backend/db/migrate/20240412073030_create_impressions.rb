class CreateImpressions < ActiveRecord::Migration[7.1]
  def change
    create_table :impressions do |t|
      t.references :devotional, null: false, foreign_key: true
      t.string :emoji

      t.timestamps
    end
  end
end

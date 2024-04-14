class CorrectSpellingOfIsPublicInDevotionals < ActiveRecord::Migration[7.1]
  def change
    rename_column :devotionals, :is_publuic, :is_public
  end
end

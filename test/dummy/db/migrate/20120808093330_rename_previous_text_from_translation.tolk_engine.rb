# This migration comes from tolk_engine (originally 20120702154708)
class RenamePreviousTextFromTranslation < ActiveRecord::Migration
  def up
    rename_column :tolk_engine_translations, :previous_text, :author
  end

  def down
    rename_column :tolk_engine_translations, :author, :previous_text
  end
end

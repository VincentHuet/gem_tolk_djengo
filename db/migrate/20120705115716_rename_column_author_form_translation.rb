class RenameColumnAuthorFormTranslation < ActiveRecord::Migration
  def up
    rename_column :tolk_engine_translations, :author, :translator_id
  end

  def down
    rename_column :tolk_engine_translations, :translator_id, :author
  end
end
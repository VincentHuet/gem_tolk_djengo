# This migration comes from tolk_engine (originally 20120703120707)
class ChangeTypeTranlatorFromTranslation < ActiveRecord::Migration
  def up
    change_column :tolk_engine_translations, :author, :integer
  end

  def down
    change_column :tolk_engine_translations, :author, :string
  end
end

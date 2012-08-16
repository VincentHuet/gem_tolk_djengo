class ChangeTypeTranlatorFromTranslation < ActiveRecord::Migration
  def up
    change_column :tolk_engine_translations, :author, :integer
  end

  def down
    change_column :tolk_engine_translations, :author, :string
  end
end

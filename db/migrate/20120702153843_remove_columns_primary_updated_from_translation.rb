class RemoveColumnsPrimaryUpdatedFromTranslation < ActiveRecord::Migration
  def up
    remove_column :tolk_engine_translations, :Primary_updated
  end

  def down
    add_column :tolk_engine_translations, :Primary_updated
  end
end

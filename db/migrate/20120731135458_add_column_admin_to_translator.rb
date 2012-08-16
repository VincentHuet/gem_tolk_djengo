class AddColumnAdminToTranslator < ActiveRecord::Migration
  def up
    add_column :tolk_engine_translators, :admin, :boolean
  end

  def down
    remove_column :tolk_engine_translators, :admin, :boolean
  end
end

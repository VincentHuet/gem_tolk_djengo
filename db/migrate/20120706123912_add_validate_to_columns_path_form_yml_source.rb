class AddValidateToColumnsPathFormYmlSource < ActiveRecord::Migration
  def change
    add_index :tolk_engine_yml_sources, :path, :unique => true
  end
end

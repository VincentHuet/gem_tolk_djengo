class AddYamlPathToPhrases < ActiveRecord::Migration
  def change
    add_column :tolk_engine_phrases, :yaml_path, :string
  end
end

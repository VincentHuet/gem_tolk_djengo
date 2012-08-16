class CreateYmlSources < ActiveRecord::Migration

  def change
    create_table :tolk_engine_yml_sources do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end

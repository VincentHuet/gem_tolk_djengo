class CreateTolkEngineLocales < ActiveRecord::Migration
  def change
    create_table :tolk_engine_locales do |t|
      t.string :name

      t.timestamps
    end
  end
end

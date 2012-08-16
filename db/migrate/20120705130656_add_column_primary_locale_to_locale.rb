class AddColumnPrimaryLocaleToLocale < ActiveRecord::Migration
  def up
    add_column :tolk_engine_locales, :primary_locale, :boolean
  end

  def down
    remove_column :tolk_engine_locales, :primary_locale, :boolean
  end
end

class AddEnValueToPhrases < ActiveRecord::Migration
  def change
    add_column :tolk_engine_phrases, :en_value, :string
  end
end

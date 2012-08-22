# == Schema Information
#
# Table name: locales
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  primary_locale :boolean
#
module TolkEngine
  class Locale < ActiveRecord::Base
    attr_accessible :name, :id, :primary_locale

    has_many :phrases
    has_many :translations, :dependent => :destroy
    has_many :translators, :dependent => :destroy

    #validates :primary_locale, presence => true

    def self.primary_locale
      Locale.find_by_primary_locale(true)
    end

    def is_primary?
      primary_locale
    end

    def self.missing_translation?
      if !locale.nil?
        current_done_translation = self.translations.where(:needed_update => 0).count
        Phrase.phrase_quantity - current_done_translation
      else
        1
      end
    end



  end
end
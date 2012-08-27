module TolkEngine
  class Ability
    include CanCan::Ability

    def initialize(translator)
      translator ||= Translator.new # guest translator

      if translator.admin
        can :manage, :all
      else
        can :read, :all

        cannot :read, YmlSource
        cannot :update, Locale
        cannot :create, Locale
        cannot :read, Translator

        can :update, Translation do |translation|
          translation.locale_id == translator.locale_id
        end
        can :create, :all
      end
    end
  end
end
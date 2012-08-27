module TolkEngine
  class Ability
    include CanCan::Ability

    def initialize(translator)
      translator ||= Translator.new # guest translator

      if translator.admin
        can :manage, :all
      else
        cannot :read, YmlSource
        cannot :read, Locale
        cannot :read, Translator

        can :update, Translation do |translation|
          translation.locale_id == translator.locale_id
        end
        can :create, :all
      end
    end
  end
end
module TolkEngine
  class HomeController < TolkEngine::ApplicationController
    protect_from_forgery

    require 'yaml'

     layout "tolk_engine/layouts/tolk_engine"

    def index
      @locales = Locale.all

      if @locales.empty?
        redirect_to tolk_engine.locales_path
      end


      if translator_signed_in?
        @missing_translation = missing_translation?(Locale.find(current_translator.locale.id))
        @ratio = ratio(@missing_translation)
      end
    end

    def ratio(missing_translation)
        primary_keyword_quantity = phrase_quantity
      if primary_keyword_quantity != 0
        ratio = (missing_translation * 100) / primary_keyword_quantity
        ratio = 100 - ratio
        ratio
      else
        ratio = 100
      end
    end

  end
end

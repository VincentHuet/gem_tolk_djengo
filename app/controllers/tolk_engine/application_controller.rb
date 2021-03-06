module TolkEngine
  class ApplicationController < ActionController::Base
    protect_from_forgery
    before_filter :initialize_locales_name

    layout "tolk_engine/layouts/tolk_engine"

    def current_ability
      @current_ability ||= Ability.new(current_translator)
    end

    rescue_from CanCan::AccessDenied do |exception|
      if !translator_signed_in?
        session[:translator_return_to] = request.url
        redirect_to new_translator_session_path, :alert => exception.message
      else
        redirect_to root_url, :alert => exception.message
      end
    end

    def standard_respond_to(class_type)
      respond_to do |format|
        format.html
        format.json { render json: class_type }
      end
    end

    def destroy_respond_to
      respond_to do |format|
        format.html { redirect_to locales_url }
        format.json { head :no_content }
      end
    end

    def create_respond_to(class_type)
      respond_to do |format|
        if class_type.save
          format.html { redirect_to class_type, notice: class_type.class.to_s + ' was successfully created.' }
          format.json { render json: class_type, status: :created, location: class_type }
        else
          fail_respond_to("new", class_type)
        end
      end
    end

    def update_respond_to(class_type, parameters, redirect_path = class_type)
      respond_to do |format|
        if class_type.update_attributes(parameters)
          format.html { redirect_to redirect_path, notice: class_type.class.to_s + ' was successfully updated.' }
          format.json { head :no_content }
        else
          fail_respond_to("edit", class_type)
        end
      end
    end

    def fail_respond_to(type_of_action, class_type)
      format.html { render action: type_of_action }
      format.json { render json: class_type.errors, status: :unprocessable_entity }
    end

    def initialize_locales_name
      @locales_name = {
        'ar' => 'Arabic',
        'bs' => 'Bosnian',
        'bt' => 'Bulgarian',
        'ca' => 'Catalan',
        'cz' => 'Czech',
        'da' => 'Danish',
        'de' => 'German',
        'dsb' => 'Lower Sorbian',
        'el' => 'Greek',
        'en' => 'English',
        'es' => 'Spanish',
        'et' => 'Estonian',
        'fa' => 'Persian',
        'fi' => 'Finnish',
        'fr' => 'French',
        'he' => 'Hebrew',
        'hr' => 'Croatian',
        'hsb' => 'Upper Sorbian',
        'hu' => 'Hungarian',
        'id' => 'Indonesian',
        'is' => 'Icelandic',
        'it' => 'Italian',
        'jp' => 'Japanese',
        'ko' => 'Korean',
        'lo' => 'Lao',
        'lt' => 'Lithuanian',
        'lv' => 'Latvian',
        'mk' => 'Macedonian',
        'nl' => 'Dutch',
        'no' => 'Norwegian',
        'pl' => 'Polish',
        'pt-BR' => 'Portuguese (Brazilian)',
        'pt-PT' => 'Portuguese (Portugal)',
        'ro' => 'Romanian',
        'ru' => 'Russian',
        'se' => 'Swedish',
        'sk' => 'Slovak',
        'sl' => 'Slovenian',
        'sr' => 'Serbian',
        'sw' => 'Swahili',
        'th' => 'Thai',
        'tr' => 'Turkish',
        'uk' => 'Ukrainian',
        'vi' => 'Vietnamese',
        'zh-CN' => 'Chinese (Simplified)',
        'zh-TW' => 'Chinese (Traditional)'
      }

    end

    def create_phrase_translation_table(translations)
      primary_locale = Locale.primary_locale
      first_locale_translations = primary_locale.translations
      translations.inject({}) do |relevant_phrase_text, translation|
        relevant_phrases = first_locale_translations.where(:phrase_id => translation.phrase_id)
        relevant_phrase = relevant_phrases.first
        relevant_phrase_text[translation.phrase_id] = relevant_phrase && relevant_phrase.text
        relevant_phrase_text
      end
    end

    def missing_translation?(locale)
      if !locale.nil?
        current_done_translation = locale.translations.where(:needed_update => 0).count
        phrase_quantity - current_done_translation
      else
        1
      end
    end

    def phrase_quantity
      reference_locale = Locale.primary_locale
      reference_locale.nil? ? 0 : reference_locale.translations.count
    end

  end
end
module TolkEngine
  module FlashHelper
    def flash_class(flash_type)
      if flash_type == :notice
        'alert-block'
      else
        'alert-error'
      end
    end

    def find_class_of_progess_bar(ratio)
      if @ratio <= 20
        'progress-danger'
      elsif @ratio <= 50
        'progress-warning'
      elsif @ratio <= 95
        'progress-info'
      else
        'progress-success'
      end
    end

    def primary(locale)
      locale.primary_locale ? "primary" : "secondary"
    end

    def locale_list(locales)
      locales.collect {|l| [ l.name, l.id ] }
    end

  end
end
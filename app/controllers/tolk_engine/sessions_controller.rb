module TolkEngine
  class SessionsController < Devise::SessionsController
    layout "tolk_engine/layouts/tolk_engine"
    def new
      super
    end

    def create
      # add custom create logic here
    end

    def update
      super
    end
  end
end

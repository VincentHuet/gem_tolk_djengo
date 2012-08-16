module TolkEngine
  class Engine < ::Rails::Engine
    isolate_namespace TolkEngine

    initializer 'tolk_engine.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper TolkEngine::FlashHelper
      end
    end

    initialize "tolk_engine.load_app_instance_data" do |app|
      TolkEngine.setup do |config|
        config.app_root = app.root
      end
    end

   initialize "tolk_engine.load_static_assets" do |app|
     app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

  end
end

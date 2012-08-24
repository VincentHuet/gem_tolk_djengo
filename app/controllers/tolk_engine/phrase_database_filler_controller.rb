module TolkEngine
  class PhraseDatabaseFillerController < TolkEngine::ApplicationController
     layout "tolk_engine/layouts/tolk_engine"
    def show
      @yml_source = YmlSource.find(params[:id])

      @counter = TolkEngine::YmlLoader.load_yaml_source(@yml_source)
    end

    def index
    	YmlSource.find_each do |yml_source|
    		@counter = TolkEngine::YmlLoader.load_yaml_source(yml_source)
    	end
    end
  end
end
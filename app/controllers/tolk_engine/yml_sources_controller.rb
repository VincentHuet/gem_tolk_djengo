module TolkEngine
  class YmlSourcesController < TolkEngine::ApplicationController
    # GET /yml_sources
    # GET /yml_sources.json

    before_filter :authenticate_translator!
    load_and_authorize_resource :yml_source, :class => TolkEngine::YmlSource

    def index
      @yml_files = TolkEngine::YmlLoader.load_pathes
      TolkEngine::YmlLoader.load_locales  # YmlLoader.load_yml_content

      @locales = Locale.all

      @missing_translations_quantity = {}
      @locales.each do |locale|
        @missing_translations_quantity[locale.id] = missing_translation?(locale)
      end

      standard_respond_to(@yml_sources)
    end

    # GET /yml_sources/1
    # GET /yml_sources/1.json
    def show
      standard_respond_to(@yml_source)
    end

    # GET /yml_sources/new
    # GET /yml_sources/new.json
    def new
      standard_respond_to(@yml_source)
    end

    # GET /yml_sources/1/edit
    def edit
    end

    # POST /yml_sources
    # POST /yml_sources.json
    def create
      create_respond_to(@yml_source)
    end

    # PUT /yml_sources/1
    # PUT /yml_sources/1.json
    def update
      update_respond_to(@yml_source, params[:yml_source])
    end

    # DELETE /yml_sources/1
    # DELETE /yml_sources/1.json
    def destroy
      @yml_source.destroy
      destroy_respond_to
    end
  end
end
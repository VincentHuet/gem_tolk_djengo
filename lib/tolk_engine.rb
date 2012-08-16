require "tolk_engine/engine"
require 'ya2yaml'

module TolkEngine
  # Our host application root path
  # We set this when the engine is initialized
   mattr_accessor :app_root

    # Yield self on setup for nice config blocks
  def self.setup
    yield self
  end

  # Setup TolkEngine
  def self.config(&block)
    if block_given?
      block.call(TolkEngine::Config)
    else
      TolkEngine::Config
    end
  end
end


# Require our engine
require "tolk_engine/engine"
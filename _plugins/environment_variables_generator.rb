# Plugin to add environment variables to the `site` object in Liquid templates
require 'dotenv'

module Jekyll
  class EnvironmentVariablesGenerator < Generator
    priority :highest
    
    def generate(site)
      Dotenv.overload
      site.config['env'] = Dotenv.overload

      site.config['title']          = ENV['SITE_TITLE']
      site.config['description']    = ENV['SITE_DESCRIPTION']
      site.config['asset_url']      = ENV['ASSET_URL']
      site.config['base_url']       = ENV['BASE_URL']
      site.config['production_url'] = ENV['PRODUCTION_URL']
      site.config['source_url']     = ENV['SOURCE_URL']
      site.config['repository']     = ENV['SOURCE_REPO']

      # sensitives
      site.config['google_analytics'] = ENV['GOOG_ANALYTICS_ID']
      site.config['heap_analytics']   = ENV['HEAP_ANALYTICS_ID']

      site.config['twitter']          = ENV['TWTR_HANDLER'] # replace by your username
      site.config['facebook']         = ENV['FB_USERNAME'] # replace by your username     

      Jekyll.logger.debug site.config.to_yaml 
    end
  end
end
# Plugin to add environment variables to the `site` object in Liquid templates
require 'dotenv'

module Jekyll
  class EnvironmentVariablesGenerator < Generator
    priority :highest
    
    def generate(site)
      site.config['env'] = Dotenv.load

      site.config['title']          = ENV['SITE_TITLE']
      site.config['description']    = ENV['SITE_DESCRIPTION']
      site.config['production_url'] = ENV['PRODUCTION_URL']
      site.config['source_url']     = ENV['SOURCE_URL']

      # sensitives
      site.config['google_analytics'] = ENV['GOOG_ANALYTICS_ID']
      site.config['twitter']          = ENV['TWTR_HANDLER'] # replace by your username
      site.config['facebook']         = ENV['FB_USERNAME'] # replace by your username      
    end
  end
end
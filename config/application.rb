require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LinkIngester
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    unless Rails.env.production?
      config.before_configuration do
        env_file = File.join(Rails.root, 'config', 'local_env.yml')
        variables = YAML.load(File.open(env_file))
        break unless variables
        variables.each do |key, value|
          ENV[key.to_s] = value
        end if File.exists?(env_file)
      end
    end
  end
end

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PrototypeRobotics::Application.initialize!

Paperclip.options[:command_path] = "/usr/local/bin/"

ActiveRecord::Base.include_root_in_json = true

# load the libraries
require 'aws'

config_path = File.expand_path File.join(File.dirname(__FILE__),"..","aws.yml")
puts "Loading AWS configuration from #{config_path}"

config = YAML.load(File.read(config_path))

puts "YAML config: #{config}"
AWS.config config['development']

puts "AWS: #{AWS.config}"


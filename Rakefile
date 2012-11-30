require 'resque'
require "resque/tasks"
require_relative 'lib/workers'

redis_host = ENV['REDIS_SERVER'] || "0.0.0.0:6379"
Resque.redis = redis_host

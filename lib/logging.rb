require 'logger'

module Logging
  def log
    @log ||= begin
      logger = Logger.new(STDOUT)
      logger.level = Logger::DEBUG
      logger
    end
  end
end
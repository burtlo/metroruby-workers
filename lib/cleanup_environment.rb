class CleanupEnvironment
  include Logging

  def initialize(options)
    @paths = options[:paths]
  end

  def cleanup_path
    @paths.user_game_path
  end

  def perform
    log.debug "Clean Up Environment - Started cleaning environment #{cleanup_path}"
    FileUtils.rm_rf cleanup_path
    log.debug "Clean Up Environment - Finished cleaning environment #{cleanup_path}"
  end
end
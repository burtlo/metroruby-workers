class PrepareEnvironment
  include Logging

  def initialize(options)
    @paths = options[:paths]
  end

  def preparation_path
    @paths.user_game_path
  end

  def perform
    log.debug "Preparing Environment - Starting Preparing Environment at path: #{preparation_path}"
    FileUtils.rm_rf preparation_path
    FileUtils.mkdir_p preparation_path
    log.debug "Prepare Environment - Finished Preparing Environment"
  end
end
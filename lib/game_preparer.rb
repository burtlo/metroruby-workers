class GamePreparer
  include Logging

  def initialize(options)
    @paths = options[:paths]
  end

  def perform
    log.debug "Game Preparer - Preparing game for Release"

    log.debug "Game Preparer - Forcing Game to Release Mode"
    force_game_to_release

    log.debug "Game Preparer - Adding Default Game Launcher"
    add_game_launcher

    log.debug "Game Preparer - Game updated for Release"
  end

  private

  def game_file
    @paths.resource File.join("source","metro")
  end

  def force_game_to_release
    game_contents = File.read(game_file)
    game_contents.gsub!(/^\s*debug\s+true\s*$/,'debug false')
    File.write(game_file,game_contents)
  end

  def source_game_launcher
    File.join File.dirname(__FILE__), "..", "templates", "game.rb"
  end

  def destination_game_launcher
    @paths.resource "game.rb"
  end

  def add_game_launcher
    FileUtils.cp source_game_launcher, destination_game_launcher
  end
end
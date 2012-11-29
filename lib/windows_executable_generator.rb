class WindowsExecutableGenerator
  include Logging

  def initialize(options)
    @paths = options[:paths]
  end

  def perform
    log.debug "Windows Executable Generator - Started Executable Generation"

    stored_working_directory = Dir.pwd

    generate_executable!

    Dir.chdir stored_working_directory

    log.debug "Windows Executeable Generator - Finished Executable Generation"
  end

  private

  def user_game_path
    @paths.user_game_path
  end

  def generate_executable!
    Dir.chdir user_game_path
    system "ocra game.rb --output game.exe --no-autoload --windows"
  end
end
class MacApplicationGenerator
  include Logging

  def initialize(options)
    @paths = options[:paths]
  end

  def perform
    log.debug "Mac Application Generator - has started creating an application"

    copy_application_wrapper
    create_application_wrapper_paths
    copy_source_into_wrapper

    log.debug "Mac Application Generator - finished creating an application"
  end

  def copy_application_wrapper
    FileUtils.cp_r application_wrapper_path, destination_application_wrapper_path
  end

  def create_application_wrapper_paths
    [ "assets", "scenes", "lib", "views", "models" ].each do |folder|
      File.mkdir_p File.join(destination_application_wrapper_path,folder)
    end
  end

  def copy_source_into_wrapper
    FileUtils.cp_r sources, destination_within_wrapper_path
  end

  private

  def application_wrapper_path
    File.join File.dirname(__FILE__), "..", "templates", "Game.app"
  end

  def destination_application_wrapper_path
    @paths.resource "Game.app"
  end

  def sources
    Dir[File.join(@paths.resource('source'),'*')]
  end

  def destination_within_wrapper_path
    @paths.resource File.join("Game.app","Contents","Resources","application")
  end

end
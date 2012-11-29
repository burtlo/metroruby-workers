require 'zip/zip'

class ZipArchivePacker
  include Logging

  def initialize(options)
    @paths = options[:paths]
  end

  def perform
    log.debug "Zip Archive Packer - Starting archive creation process"

    Zip::ZipFile.open(destination, Zip::ZipFile::CREATE) do |zip|
      sources.each do |relative,absolute|
        zip.add relative, absolute
      end
    end

    log.debug "Zip Archive Packer - Finished archive creation process"
  end

  private

  def destination
    @paths.resource "game.zip"
  end

  def sources
    [ game_executable ] + source_files
  end

  def source_files_path
    @paths.resource "source"
  end

  def relative_path_for_file(absolute_path)
    absolute_path.gsub("#{@paths.user_game_path}/",'')
  end

  def source_files
    Dir[File.join(source_files_path,"**","*")].map { |f| [ relative_path_for_file(f), f ] }
  end

  def game_executable
    [ "game.exe", @paths.resource("game.exe") ]
  end
end
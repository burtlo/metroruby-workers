require 'zip/zip'

class MacZipArchivePacker
  include Logging

  def initialize(options)
    @options = options
    @paths = options[:paths]
  end

  def perform
    log.debug "Mac Archive Packer - Starting archive creation process"

    Zip::ZipFile.open(destination, Zip::ZipFile::CREATE) do |zip|
      sources.each do |relative,absolute|
        zip.add relative, absolute
      end
    end

    @options[:complete_archive_path] = destination

    log.debug "Mac Archive Packer - Finished archive creation process"
  end

  private

  def platform
    :mac
  end

  def destination
    @paths.resource "#{@paths.game_name}-#{platform}.zip"
  end

  def sources
    source_files
  end

  def source_files
    Dir[File.join(source_files_path,"**","*")].map { |f| [ relative_path_for_file(f), f ] }
  end

  def source_files_path
    @paths.resource "Game.app"
  end

  def relative_path_for_file(absolute_path)
    absolute_path.gsub("#{@paths.user_game_path}/",'')
  end
end
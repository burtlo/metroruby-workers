require 'fileutils'
require 'logger'
require 'active_support/core_ext/hash'
require 'zlib'
require 'archive/tar/minitar'
require 'zip/zip'

require_relative 'amazon'


class PCApplication
  @queue = :pc_application_queue

  class << self

    def perform(options)
      options.symbolize_keys!

      prepare(options)

      retrieve_source(options)

      unpack_source(options)

      convert_game_to_release(options)

      copy_metro_basefiles(options)

      run_ocra(options)

      package_game(options)

      store_game(options)

      clean_up(options)
    end

    def package_game(options)
      log.debug "Zipping game and source files"

      zipfile_path = File.join game_output_path(options), "game.zip"

      executable_path = File.join game_output_path(options), "game.exe"
      source_path = File.join game_output_path(options), "source"

      Zip::ZipFile.open(zipfile_path, Zip::ZipFile::CREATE) do |zip|
        zip.add "game.exe", executable_path

        Dir[File.join(source_path,"**","*")].each do |file|
          relative_filepath = File.join "source", file.gsub(source_path,'')
          zip.add relative_filepath, file
        end
      end
    end

    def store_game(options)
      log.debug "Storing game zip to amazon S3"

      s3 = AWS::S3.new

      bucket_name = 'rubymetro-dev'
      bucket = s3.buckets[bucket_name]

      game_archive_zip = File.join game_output_path(options), "game.zip"

      amazon_path = File.join game_output_relative_path(options), "game.zip"

      obj = bucket.objects[amazon_path]
      obj.delete file: game_archive_zip
      obj.write file: game_archive_zip
      log.debug "Created object at #{obj.public_url}"
    end

    def copy_metro_basefiles(options)
      copy_game_file(options)
    end

    def copy_game_file(options)
      source = File.join File.dirname(__FILE__), "..", "game.rb"
      destination = File.join game_output_path(options), "game.rb"
      FileUtils.cp source, destination
    end

    def convert_game_to_release(options)
      log.debug "Converting game to release mode"

      game_file = File.join game_output_path(options), "source", "metro"
      game_contents = File.read(game_file)

      game_contents.gsub!(/^\s+debug\s+true\s+$/,'debug false')
      File.write(game_file,game_contents)
    end

    def run_ocra(options)
      log.debug "Generating executable with Ocra"

      cwd = Dir.pwd
      Dir.chdir game_output_path(options)
      system "ocra game.rb --output game.exe --no-autoload --windows"
      Dir.chdir cwd
    end

    def prepare(options)
      log.debug "Preparing game path: #{game_output_path(options)}"
      FileUtils.rm_rf game_output_path(options)
      FileUtils.mkdir_p game_output_path(options)
    end

    def game_output_path(options)
      base_directory = File.join File.dirname(__FILE__), ".."
      relative_path = game_output_relative_path(options)
      File.absolute_path File.join base_directory, relative_path
    end

    def game_output_relative_path(options)
      user_name = options[:user_name].underscore.gsub(/\s/,'_')
      game_name = options[:game_name].underscore.gsub(/\s/,'_')

      File.join user_name, game_name
    end

    def retrieve_source(options)
      amazon_archive_path = File.join game_output_relative_path(options), "archive.tar.gz"
      local_archive_path = File.join game_output_path(options), "archive.tar.gz"

      log.debug "Retrieving source from Amazon #{amazon_archive_path}"

      s3 = AWS::S3.new
      bucket_name = 'rubymetro-dev'
      bucket = s3.buckets[bucket_name]
      obj = bucket.objects[amazon_archive_path]
      File.open(local_archive_path,"wb") do |file|
        file.puts obj.read
      end

      game_archive_zip = File.join game_output_path(options), "game.zip"
    end

    def unpack_source(options)
      source = File.join game_output_path(options), "archive.tar.gz"
      destination = File.join game_output_path(options), "source"
      log.debug "Unpacking source #{source} to #{destination}"

      tgz = Zlib::GzipReader.new File.open(source, 'rb')
      Archive::Tar::Minitar.unpack(tgz,destination)
    end

    def user_output_path(options)
      base_directory = File.join File.dirname(__FILE__), ".."
      user_name = options[:user_name].underscore.gsub(/\s/,'_')
      File.absolute_path File.join base_directory, user_name
    end

    def clean_up(options)
      log.debug "Cleaning Up game #{user_output_path(options)}"
      FileUtils.rm_rf user_output_path(options)
    end

    def log
      @log ||= begin
        logger = Logger.new(STDOUT)
        logger.level = Logger::DEBUG
        logger
      end
    end

  end

end
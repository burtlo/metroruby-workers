require 'fileutils'
require 'active_support/core_ext/hash'
require_relative 'logging'

require_relative 'amazon'
require_relative 'archive_unpacker'
require_relative 'asset_paths'
require_relative 'cleanup_environment'
require_relative 'game_preparer'
require_relative 'prepare_environment'
require_relative 's3_source_deliverer'
require_relative 's3_source_retriever'
require_relative 'windows_executable_generator'
require_relative 'windows_zip_archive_packer'

class PCApplication
  @queue = :pc_application_queue

  class << self

    def perform(options)
      options.symbolize_keys!

      paths = AssetPaths.new options
      step_options = { paths: paths, bucket_name: 'rubymetro-dev' }

      application_preparation_steps.each do |step|
        step_instance = step.new step_options
        step_instance.perform
      end
    end

    def application_preparation_steps
      [ PrepareEnvironment,
        S3SourceRetriever,
        ArchiveUnpacker,
        GamePreparer,
        WindowsExecutableGenerator,
        WindowsZipArchivePacker,
        S3SourceDeliverer,
        CleanupEnvironment ]
    end
  end

end
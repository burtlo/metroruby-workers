class MacApplication
  @queue = :mac_application_queue

  class << self

    def perform(options)
      options.symbolize_keys!

      paths = AssetPaths.new options
      step_options = { paths: paths, bucket_name: 'rubymetro-dev' }

      application_preparation_steps.each do |step|
        step_instance = step.new step_options
        step_instance.perform
      end

       Resque.enqueue AddRelease, options.merge(platform: :mac, url: step_options[:s3_public_url])

    end

    def application_preparation_steps
      [ PrepareEnvironment,
        S3SourceRetriever,
        ArchiveUnpacker,
        GamePreparer,
        MacApplicationGenerator,
        MacZipArchivePacker,
        S3SourceDeliverer,
        CleanupEnvironment ]
    end
  end

end
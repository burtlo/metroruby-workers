class S3SourceDeliverer
  include Logging

  def initialize(options)
    @paths = options[:paths]
    @bucket_name = options[:bucket_name]
    @source = options[:complete_archive_path]
  end

  attr_reader :bucket_name, :source

  def destination
    File.join @paths.relative_user_game_path, File.basename(source)
  end

  def perform
    log.debug "Amazon S3 - Pushing source #{source}"

    s3_object.delete
    s3_object.write file: source

    log.debug "Amazong S3 - Finished pushing source to #{s3_object.public_url}"
  end

  private

  def s3
    AWS::S3.new
  end

  def bucket
    s3.buckets[bucket_name]
  end

  def s3_object
    bucket.objects[destination]
  end
end
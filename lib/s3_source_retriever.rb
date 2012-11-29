class S3SourceRetriever
  include Logging

  def initialize(options)
    @paths = options[:paths]
    @bucket_name = options[:bucket_name]
  end

  attr_reader :bucket_name

  def source
    File.join @paths.relative_user_game_path, "archive.tar.gz"
  end

  def destination
    File.join @paths.user_game_path, "archive.tar.gz"
  end

  def perform
    log.debug "Amazon S3 - retrieving source #{source}"
    File.open(destination,"wb") { |file| file.puts s3_object(source).read }
    log.debug "Amazon S3 - source retrieved and stored to #{destination}"
  end

  private

  def s3
    AWS::S3.new
  end

  def bucket
    s3.buckets[bucket_name]
  end

  def s3_object(path)
    bucket.objects[path]
  end
end
require 'zlib'
require 'archive/tar/minitar'

class ArchiveUnpacker
  include Logging

  def initialize(options)
    @paths = options[:paths]
  end

  def source
    File.join @paths.user_game_path, "archive.tar.gz"
  end

  def destination
    File.join @paths.user_game_path, "source"
  end

  def perform
    log.debug "Archive Unpacker - Unpacking archive #{source}"
    tgz = Zlib::GzipReader.new File.open(source, 'rb')
    Archive::Tar::Minitar.unpack(tgz,destination)
    log.debug "Archive Unpacker - Finished unpacking archive to #{destination}"
  end
end
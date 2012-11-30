require 'fileutils'
require 'active_support/all'
require_relative 'logging'

require_relative 'amazon'
require_relative 'archive_unpacker'
require_relative 'asset_paths'
require_relative 'cleanup_environment'
require_relative 'game_preparer'
require_relative 'prepare_environment'
require_relative 's3_source_deliverer'
require_relative 's3_source_retriever'

require_relative 'pc_application'
require_relative 'windows_executable_generator'
require_relative 'windows_zip_archive_packer'

require_relative 'mac_application'
require_relative 'mac_application_generator'
require_relative 'mac_zip_archive_packer'

require_relative 'add_release'
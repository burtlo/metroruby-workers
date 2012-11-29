require 'metro'

options = []

if defined?(Ocra)
  options.push '--dry-run'
end

Dir.chdir 'source'
Metro.run *options
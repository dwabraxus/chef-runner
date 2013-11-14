require "cucumber"
require "aruba/cucumber"

# Add shims to PATH
ENV['PATH'] = "#{Dir.pwd}/features/shims#{File::PATH_SEPARATOR}#{ENV['PATH']}"

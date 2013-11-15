require "cucumber"
require "aruba/cucumber"

# Add shims to PATH
SHIMS = "#{Dir.pwd}/tmp/aruba/shims"
ENV['PATH'] = "#{SHIMS}:#{ENV['PATH']}"

def generate_shims_for(commands)
  FileUtils.mkdir_p(SHIMS)
  commands.each do |cmd|
    File.open("#{SHIMS}/#{cmd}", "w", 0755) do |f|
      f << "#!/bin/sh\n"
      f << "echo \"#{cmd} $@\"\n"
    end
  end
end

Before do
  generate_shims_for %w(berks rsync ssh vagrant)
end

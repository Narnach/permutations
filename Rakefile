require "rake"
require "rake/clean"
require "rake/gempackagetask"
require 'rubygems'

################################################################################
### Gem
################################################################################

begin
  # Parse gemspec using the github safety level.
  file = Dir['*.gemspec'].first
  data = File.read(file)
  spec = nil
  # FIXME: Lowered SAFE from 3 to 2 to work with Ruby 1.9 due to rubygems
  # performing a require internally
  Thread.new { spec = eval("$SAFE = 2\n%s" % data)}.join

  # Create the gem tasks
  Rake::GemPackageTask.new(spec) do |package|
    package.gem_spec = spec
  end
rescue Exception => e
  printf "WARNING: Error caught (%s): %s\n%s", e.class.name, e.message, e.backtrace[0...5].map {|l| '  %s' % l}.join("\n")
end

desc 'Package and install the gem for the current version'
task :install => :gem do
  system "sudo gem install -l pkg/%s-%s.gem" % [spec.name, spec.version]
end

desc 'Show files missing from gemspec'
task :diff do
  all_files_and_dirs = Dir.glob('**/*')
  files_and_dirs_to_ignore = %w[pkg coverage doc].map {|dir| Dir.glob("#{dir}/**/*")}.flatten
  files_and_dirs = all_files_and_dirs - files_and_dirs_to_ignore
  files = files_and_dirs.select{|f| File.file?(f)}
  missing_files = files - spec.files
  extra_files = spec.files - files
  unless missing_files.empty?
    puts "Missing files:"
    puts missing_files.join(" ")
  end
  unless extra_files.empty?
    puts "Extra files:"
    puts extra_files.join(" ")
  end
end

desc "Uninstall all #{spec.name} versions and install version #{spec.version}"
task :upgrade do
  system("sudo gem uninstall -a -x #{spec.name} && rake gem && gem install pkg/#{spec.name}-#{spec.version}.gem")
end
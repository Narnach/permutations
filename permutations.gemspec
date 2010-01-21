Gem::Specification.new do |s|
  # Project
  s.name         = 'permutations'
  s.summary      = "Permutations is a library that allows you to generate permutations from Arrays and Strings."
  s.description  = s.summary
  s.version      = '0.1.1'
  s.date         = '2010-01-21'
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Wes Oldenbeuving"]
  s.email        = "narnach@gmail.com"
  s.homepage     = "http://www.github.com/narnach/permutations"

  # Files
  root_files     = %w[Readme.rdoc Rakefile permutations.gemspec init.rb MIT-LICENSE]
  bin_files      = []
  lib_files      = %w[permutations]
  s.bindir       = "bin"
  s.require_path = "lib"
  s.executables  = bin_files
  s.test_files   = []
  s.files        = root_files + s.test_files + bin_files.map {|f| 'bin/%s' % f} + lib_files.map {|f| 'lib/%s.rb' % f}

  # rdoc
  s.has_rdoc         = true
  s.extra_rdoc_files = %w[ Readme.rdoc]
  s.rdoc_options << '--inline-source' << '--line-numbers' << '--main' << 'Readme.rdoc'

  # Requirements
  s.required_ruby_version = ">= 1.8.0"
end

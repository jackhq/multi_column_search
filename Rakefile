#require 'spec/rake/spectask'

require 'echoe'
Echoe.new 'multi_column_search' do |p|
  p.description     = "Quick and dirty multi column LIKE searches."
  p.url             = "http://github.com/jackhq/multi_column_search"
  p.author          = "Jack Russell Software"
  p.email           = "team@jackrussellsoftware.com"
  p.retain_gemspec  = true
  p.need_tar_gz     = false
  p.extra_deps      = [
  ]
  p.ignore_pattern  = ['spec/test.sqlite3']
end

desc 'Default: run specs'
task :default => :spec
task :test => :spec

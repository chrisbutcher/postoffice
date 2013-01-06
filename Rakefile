require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'rubygems'
require 'active_record'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the postoffice plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

# desc 'Generate documentation for the postoffice plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Postoffice'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
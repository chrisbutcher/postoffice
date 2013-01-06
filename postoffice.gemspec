Gem::Specification.new do |s|
  s.name    = 'postoffice'
  s.version = '0.0.9'
  s.date    = '2013-01-05'
  
  s.summary     = 'Rails gem to validate format of various world postal codes, and more.'
  s.description = 'Implements an ActiveModel::EachValidator that can be added to your models in a single line, to validate the format of various world postal codes. More features for working with addresses to come.'
  
  s.authors  = ['Christopher Butcher']
  s.email    = 'cbutcher@gmail.com'
  s.homepage = 'https://github.com/chrisbutcher/postoffice'
  s.license = 'Creative Commons Attribution-ShareAlike 3.0'
  
  s.files = ['README.md',
             'LICENSE',             
             'COUNTRYCODES.md',
             'Rakefile',
             'init.rb',
             'lib/postoffice.rb',
             'test/postcode_validator_test.rb',
             'test/test_helper.rb']

  s.require_paths << 'lib'

  s.test_files = ['test/postcode_validator_test.rb']

  s.has_rdoc = true  
end
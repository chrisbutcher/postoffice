Gem::Specification.new do |s|
  s.name    = 'postoffice'
  s.version = '0.0.2'
  s.date    = '2013-01-02'
  
  s.summary     = 'Rails gem to validate format of various world postal codes, and more'
  s.description = 'Implements an ActiveModel::EachValidator that can be added to your models in a single line. More features for dealing with addresses to come'
  
  s.authors  = ['Christopher Butcher']
  s.email    = 'cbutcher@gmail.com'
  s.homepage = 'https://github.com/chrisbutcher/postoffice'
  
  s.files = ['CHANGELOG',
             'LICENSE',
             'README.md',
             'Rakefile',
             'init.rb',
             'lib/postcode_validator.rb',
             'test/postcode_validator_test.rb',
             'test/helper.rb']

  s.test_files = ['test/postcode_validator_test.rb']

  s.has_rdoc = false  
end
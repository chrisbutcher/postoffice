Postoffice
==========

Installation:
-------------
	gem install postoffice

Usage:
------
To validate various world postal codes:

	class MyClass < ActiveRecord::Base
	  validates :postal_code, :postcode_format => {:country_code => :us}, :message => 'Invalid Postal Code', :allow_nil => true
	end

To validate Canadian postal codes, simply change the symbol :us to :ca. The same goes for all other supported countries, with country name codes abiding by the ISO 3166-1 alpha-2 standard.

License:
--------
See the LICENSE file.
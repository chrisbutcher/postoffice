Postoffice
==========

### Rails gem to validate format of various world postal and zip codes, and more.

Installation:
-------------
	gem install postoffice

or add the following to your Gemfile

	gem 'postoffice'

Usage as a Rails validator:
---------------------------
To validate various world postal codes:

	class MyClass < ActiveRecord::Base
	  validates :postcode, :postcode_format => {:country_code => :us, :message => "entered is not a valid postcode for #{PostOffice.country_name(options[:country_code])}."}
	end

To validate Canadian postal codes, simply change the symbol :us to :ca, and you'll get:
![An example Postoffice error message](http://i.imgur.com/3ed7b.png "An example Postoffice error message")

> Note: Don't forget to use the ':allow_blank => true' option, when needed.

Country name codes abide by the [ISO 3166-1 alpha-2 standard](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). 155 countries are supported: see COUNTRYCODES.md for the full list.

General usage:
--------------
Validating correctness of postcodes directly:
	
	# Validating an English postcode. Returns 0, since this postcode is valid, returns nil otherwise
	PostOffice.validate_postcode('N1 9GU', :gb)

To produce a string of the name of a country, input a supported 2-digit country code as a symbol.

Example:

	PostOffice.country_name(:us)

This will output "United States".

	PostOffice.country_name(:lu)

This will output "Luxembourg".

License:
--------
See the LICENSE file.
# Notes:
# ActiveRecord testing in local sqlite, running in memory
# http://devblog.avdi.org/2011/01/14/activerecord-golf/

require 'test/unit'

require 'active_record'
require 'postoffice'

require File.dirname(__FILE__) + '/test_helper.rb'

ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3",
	:database => ":memory:")

# ActiveRecord::Base.connection.create_table(:test_records) do |t|
# 	t.string :postcode
# 	t.string :country_code
# end

class ValidatesAsPostCodeTest < Test::Unit::TestCase
	
	# Valid post codes
	def test_valid_post_codes
		valid_post_codes.each_pair do |key, value|

			test_model_class = Class.new(ActiveRecord::Base) do
			  def self.name
			    'TestRecord'
			  end

			  def self.columns; []; end
				attr_accessor :postcode

				validates :postcode, :postcode_format => {:country_code => key}
			end

			value.each do |code|
				assert test_model_class.new(:postcode => code.to_sym).valid?, "#{code} should be valid."
			end
		end
	end

	# Invalid post codes
	def test_invalid_post_codes
		invalid_post_codes.each_pair do |key, value|
			test_model_class = Class.new(ActiveRecord::Base) do
			  def self.name
			    'TestRecord'
			  end

			  def self.columns; []; end
				attr_accessor :postcode

				validates :postcode, :postcode_format => {:country_code => key}
			end

			value.each do |code|
				assert test_model_class.new(:postcode => code.to_sym).invalid?, "#{code} should be invalid."
			end
		end
	end

	def test_manual_valid_post_codes
		assert PostOffice.validate_postcode('N1 9GU', :gb), "should evaluate true"
		assert PostOffice.validate_postcode('K1A 0A6', :ca), "should evaluate true"
		assert PostOffice.validate_postcode('20500', :us), "should evaluate true"
	end

	def test_manual_invalid_post_codes
		assert !PostOffice.validate_postcode('N1GU', :gb), "should evaluate false"
		assert !PostOffice.validate_postcode('K1A 0AX6', :ca), "should evaluate false"
		assert !PostOffice.validate_postcode('2050', :us), "should evaluate false"
	end

	def test_country_code_name_retrieval
		assert PostOffice.country_name(:us) == "United States", "should evaluate to 'United States'"
		assert PostOffice.country_name(:la) == "Lao People's Democratic Republic", "should evaluate to 'Lao People's Democratic Republic'"
		assert PostOffice.country_name(:vi) == "Virgin Islands, U.S.", "should evaluate to 'Virgin Islands, U.S.'"
	end
	
	# Test blank post codes
	def test_blank_post_code_allowed

		test_model_class = Class.new(ActiveRecord::Base) do
			  def self.columns; []; end
				attr_accessor :postcode

				validates :postcode, :postcode_format => {:country_code => true}, :allow_blank => true
			end

	  assert !test_model_class.new(:postcode => nil).invalid?, "Blank post code should be legal."
	  assert !test_model_class.new(:postcode => '').invalid?, "Blank post code should be legal."
	end
end
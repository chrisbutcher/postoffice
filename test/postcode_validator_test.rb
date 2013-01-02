# Notes:
# ActiveRecord testing in local sqlite, running in memory
# http://devblog.avdi.org/2011/01/14/activerecord-golf/

require 'test/unit'

require 'active_record'
require 'postcode_validator'

require File.dirname(__FILE__) + '/helper.rb'

ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3",
	:database => ":memory:")

# ActiveRecord::Base.connection.create_table(:test_records) do |t|
# 	t.string :postcode
# 	t.string :country_code
# end

# class TestRecord_US < ActiveRecord::Base
# 	def self.columns; []; end
# 	attr_accessor :postcode

# 	validates :postcode, :postcode_format => {:country_code => :us}
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
	
	# Test blank post codes
	def test_blank_post_code_not_allowed

		test_model_class = Class.new(ActiveRecord::Base) do
			  def self.columns; []; end
				attr_accessor :postcode

				validates :postcode, :postcode_format => {:country_code => true}
			end

	  assert test_model_class.new(:postcode => nil).invalid?, "Blank post code should be illegal."
	  assert test_model_class.new(:postcode => '').invalid?, "Blank post code should be illegal."
	end 	
end
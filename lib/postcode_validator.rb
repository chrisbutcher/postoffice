class PostcodeFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    case options[:country_code]
      when :us # United States
        regexStr = '\d{5}(-\d{4})?'
      when :ca # Canada
        regexStr = '[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}'
      when :gb # United Kingdom (Great Britain)
        regexStr = '([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)'
      when :cn # China
        regexStr = '([0-9]){6}'
      else     # Default to United States
        regexStr = '\d{5}(-\d{4})?'
    end

    unless value =~ /^#{regexStr}$/i
      object.errors[attribute] << (options[:message] || "is not formatted properly") 
    end
  end
end
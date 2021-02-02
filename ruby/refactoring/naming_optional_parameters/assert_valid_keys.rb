module AssertValidKeys
  def assert_valid_keys(*valid_keys)
    unknown_keys = keys - [valid_keys].flatten
    return unless unknown_keys.any?

    raise ArgumentError, "Unknown key(s): #{unknown_keys.join(', ')}"
  end
end

class Hash
  include AssertValidKeys
end

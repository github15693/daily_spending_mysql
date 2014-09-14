module ApplicationHelper

  def encrypt val                       # => #<ActiveSupport::MessageEncryptor ...>
    return AESCrypt.encrypt(val, init_key)              # => "NlFBTTMwOUV5UlA1QlNEN2xkY2d6eThYWWh..."
  end

  def decrypt val
    return AESCrypt.decrypt(val, init_key).force_encoding("UTF-8")
  end

  def init_key key_init='@kt15693@'
    return key_init
  end

end

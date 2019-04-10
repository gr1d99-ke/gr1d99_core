require "gr1d99_core/railtie"
require "jwt"

module Gr1d99Core
  class JWT
    def self.encode(opts, algorithm: 'HS256')
      payload = opts.fetch(:payload)
      key = opts.fetch(:key)

      ::JWT.encode(payload, key, algorithm)
    end

    def self.decode(opts)
      token = opts.fetch(:token)
      key = opts.fetch(:key)
      verify = opts.fetch(:verify)
      custom_options = opts.fetch(:custom_options)

      ::JWT.decode(token, key, verify, custom_options)
    end
  end
end

require "gr1d99_core/railtie"
require "gr1d99_core/jwt"

module Gr1d99Core
  module Helpers
    def self.jwt_config
      JWTConfig.new(key: 123, verify: true, algorithm: 'HS512', exp: nil)
    end

    def self.auth_required
      p jwt_config
      auth_header = 'HTTP_AUTHORIZATION'
      jwt_token = request.env[auth_header].split(' ')[-1]
      decoded_jwt_data = JWT.decode(jwt_token, jwt_conf)

    end
  end
end

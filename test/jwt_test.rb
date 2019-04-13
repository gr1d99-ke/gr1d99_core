require "test_helper"

class Gr1d99Core::JWT::Test < ActiveSupport::TestCase
  def setup
    @name = "Gideon"
    @algorithm = 'HS512'
    @key = "1234"
    @verify = true
    @exp = nil
    @config = Gr1d99Core::JWTConfig.new(key: @key, verify: @verify, algorithm: @algorithm, exp: @exp)
    @payload = { name: @name }
  end

  test "encode" do
    assert !Gr1d99Core::JWT.encode(@payload, @config).blank?
  end

  test "decode" do
    token = Gr1d99Core::JWT.encode(@payload, @config)
    data = Gr1d99Core::JWT.decode(token, @config)
    payload = data[0]

    assert payload["name"] == @name
  end

  test "raises JWT::ExpiredSignature when token is expired" do
    exp = Time.now.to_i + 1
    config = Gr1d99Core::JWTConfig.new(key: @key, verify: @verify, algorithm: @algorithm, exp: exp)
    token = Gr1d99Core::JWT.encode(@payload, config)
    sleep(2)

    assert_raises(JWT::DecodeError) { Gr1d99Core::JWT.decode(token, @config) }
  end

  test "raises JWT::VerificationError when invalid key is used" do
    token = Gr1d99Core::JWT.encode(@payload, @config)
    invalid_config = Gr1d99Core::JWTConfig.new(key: "456", verify: @verify, algorithm: @algorithm, exp: nil)

    assert_raises(JWT::VerificationError) { Gr1d99Core::JWT.decode(token, invalid_config) }
  end

  test "raises JWT::IncorrectAlgorithm when algorithm is incorrect" do
    token = Gr1d99Core::JWT.encode(@payload, @config)
    invalid_config = Gr1d99Core::JWTConfig.new(key: @key, verify: true, algorithm: 'HS256', exp: nil)

    assert_raises(JWT::IncorrectAlgorithm) { Gr1d99Core::JWT.decode(token, invalid_config) }
  end
end

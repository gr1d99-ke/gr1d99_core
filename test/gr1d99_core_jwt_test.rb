require "test_helper"

class Gr1d99Core::JWT::Test < ActiveSupport::TestCase
  test "encode" do
    options = { payload: { name: "gideon" }, key: "1234" }
    assert !Gr1d99Core::JWT.encode(options).blank?
  end

  test "decode" do
    key = "1234"
    name = "gideon"
    encode_options = { payload: { name: name }, key: key }
    token = Gr1d99Core::JWT.encode(encode_options)
    decode_options = {
      token: token,
      key: key,
      verify: true,
      custom_options: {
        algorithim: 'HS256'
      }
    }

    data = Gr1d99Core::JWT.decode(decode_options)
    payload = data[0]

    assert payload["name"] == name
  end
end

require 'test_helper'

class Gr1d99Core::Test < ActiveSupport::TestCase
  test "truth" do
    p Gr1d99Core::Helpers.auth_required
    assert_kind_of Module, Gr1d99Core
  end
end

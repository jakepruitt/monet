require "test_helper"
class UsersControllerTest < ActionController::TestCase
  fixtures :all
  test "when not signed in, redirect" do
    get  :edit, id: "1"
    assert_response :redirect
  end

end

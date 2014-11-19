require "test_helper"
class UsersControllerTest < ActionController::TestCase
  fixtures :all
  #test "when not signed in, redirect" do
  #  get :edit, id: 1
  #  assert_response :redirect
  #end

context "when signed in" do
    setup do
      @user = User.find(1)
      sign_in_as @user
    end

    should "render edit" do
      get :edit, id: 1
      assert_response :success
    end

    should "not edit another user" do
      assert_raises(ActiveRecord::RecordNotFound) do
        get :edit, id: 2
      end
    end
  end

end

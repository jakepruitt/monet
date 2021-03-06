require "test_helper"
class ImagesControllerTest < ActionController::TestCase
  fixtures :all

  test "when not signed in, index redirects" do
     get :index
     assert_response :redirect
  end
  test "when not signed in, destroy redirects" do
     delete :destroy, id: 1
     assert_response :redirect
  end
  test "when not signed in, edit redirects" do
     get :edit, id: 1
     assert_response :redirect
  end
  test "when not signed in, new redirects" do
     get :new
     assert_response :redirect
  end
  test "when not signed in, update redirect" do
     post :update, id: 1
     assert_response :redirect
  end
  test "when not signed in, create redirects" do
     post :create, id: 1
     assert_response :redirect
   end
  test "when not signed in, show redirect" do
     get :show, id: 1
     assert_response :redirect
   end

  #assert_routing '/images', {controller: "images", action: "new" }
  #assert_routing '/images/new', {controller: "images", action: "new" }
  #assert_routing '/images/1', {controller: "images", action: "show"}

  context "when signed in" do
    setup do
      @user = User.find(1)
      sign_in_as @user
    end

    should "render index" do
      get :index
      assert_response :success
    end

    should "render new" do
      get :new
      assert_response :success
    end

    should "render create" do
      post :create, post: { title: "something" }
      assert_response :redirect
    end

    should "render edit" do
      get :edit, id: 1
      assert_response :success
    end

    should "not show image not owned by user" do
      assert_raises(ActiveRecord::RecordNotFound) do
        get :show, id: 2
      end
    end

    should "render show" do
      get :show, id: 1
      assert_response :success
    end

    should "not update image not owned by user" do
      assert_raises(ActiveRecord::RecordNotFound) do
        patch :update, id: 2, patch: { title: "something" }
      end
    end

    should "render update" do
      patch :update, id: 1, patch: {title: "sdsafgd"}
      assert_response :redirect
    end

    should "not destroy image not owned by user" do
      assert_raises(ActiveRecord::RecordNotFound) do
        delete :destroy, id: 2
      end
    end

    should "render destroy" do
      delete :destroy, id: 1
      assert_response :redirect
    end
  end
end

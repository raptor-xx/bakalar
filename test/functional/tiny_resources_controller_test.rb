require 'test_helper'

class TinyResourcesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiny_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tiny_resource" do
    assert_difference('TinyResource.count') do
      post :create, :tiny_resource => { }
    end

    assert_redirected_to tiny_resource_path(assigns(:tiny_resource))
  end

  test "should show tiny_resource" do
    get :show, :id => tiny_resources(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tiny_resources(:one).id
    assert_response :success
  end

  test "should update tiny_resource" do
    put :update, :id => tiny_resources(:one).id, :tiny_resource => { }
    assert_redirected_to tiny_resource_path(assigns(:tiny_resource))
  end

  test "should destroy tiny_resource" do
    assert_difference('TinyResource.count', -1) do
      delete :destroy, :id => tiny_resources(:one).id
    end

    assert_redirected_to tiny_resources_path
  end
end

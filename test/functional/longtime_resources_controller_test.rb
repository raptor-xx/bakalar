require 'test_helper'

class LongtimeResourcesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:longtime_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create longtime_resource" do
    assert_difference('LongtimeResource.count') do
      post :create, :longtime_resource => { }
    end

    assert_redirected_to longtime_resource_path(assigns(:longtime_resource))
  end

  test "should show longtime_resource" do
    get :show, :id => longtime_resources(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => longtime_resources(:one).id
    assert_response :success
  end

  test "should update longtime_resource" do
    put :update, :id => longtime_resources(:one).id, :longtime_resource => { }
    assert_redirected_to longtime_resource_path(assigns(:longtime_resource))
  end

  test "should destroy longtime_resource" do
    assert_difference('LongtimeResource.count', -1) do
      delete :destroy, :id => longtime_resources(:one).id
    end

    assert_redirected_to longtime_resources_path
  end
end

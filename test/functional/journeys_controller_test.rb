require 'test_helper'

class JourneysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journeys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journey" do
    assert_difference('Journey.count') do
      post :create, :journey => { }
    end

    assert_redirected_to journey_path(assigns(:journey))
  end

  test "should show journey" do
    get :show, :id => journeys(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => journeys(:one).id
    assert_response :success
  end

  test "should update journey" do
    put :update, :id => journeys(:one).id, :journey => { }
    assert_redirected_to journey_path(assigns(:journey))
  end

  test "should destroy journey" do
    assert_difference('Journey.count', -1) do
      delete :destroy, :id => journeys(:one).id
    end

    assert_redirected_to journeys_path
  end
end

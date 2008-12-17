require 'test_helper'

class CashbooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cashbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cashbook" do
    assert_difference('Cashbook.count') do
      post :create, :cashbook => { }
    end

    assert_redirected_to cashbook_path(assigns(:cashbook))
  end

  test "should show cashbook" do
    get :show, :id => cashbooks(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cashbooks(:one).id
    assert_response :success
  end

  test "should update cashbook" do
    put :update, :id => cashbooks(:one).id, :cashbook => { }
    assert_redirected_to cashbook_path(assigns(:cashbook))
  end

  test "should destroy cashbook" do
    assert_difference('Cashbook.count', -1) do
      delete :destroy, :id => cashbooks(:one).id
    end

    assert_redirected_to cashbooks_path
  end
end

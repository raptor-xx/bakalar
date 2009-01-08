require 'test_helper'

class InvoiceInsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_ins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_in" do
    assert_difference('InvoiceIn.count') do
      post :create, :invoice_in => { }
    end

    assert_redirected_to invoice_in_path(assigns(:invoice_in))
  end

  test "should show invoice_in" do
    get :show, :id => invoice_ins(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => invoice_ins(:one).id
    assert_response :success
  end

  test "should update invoice_in" do
    put :update, :id => invoice_ins(:one).id, :invoice_in => { }
    assert_redirected_to invoice_in_path(assigns(:invoice_in))
  end

  test "should destroy invoice_in" do
    assert_difference('InvoiceIn.count', -1) do
      delete :destroy, :id => invoice_ins(:one).id
    end

    assert_redirected_to invoice_ins_path
  end
end

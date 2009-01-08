require 'test_helper'

class InvoiceOutsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_outs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_out" do
    assert_difference('InvoiceOut.count') do
      post :create, :invoice_out => { }
    end

    assert_redirected_to invoice_out_path(assigns(:invoice_out))
  end

  test "should show invoice_out" do
    get :show, :id => invoice_outs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => invoice_outs(:one).id
    assert_response :success
  end

  test "should update invoice_out" do
    put :update, :id => invoice_outs(:one).id, :invoice_out => { }
    assert_redirected_to invoice_out_path(assigns(:invoice_out))
  end

  test "should destroy invoice_out" do
    assert_difference('InvoiceOut.count', -1) do
      delete :destroy, :id => invoice_outs(:one).id
    end

    assert_redirected_to invoice_outs_path
  end
end

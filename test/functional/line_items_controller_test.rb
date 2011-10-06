require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_items" do
    assert_difference('LineItems.count') do
      post :create, :line_items => { }
    end

    assert_redirected_to line_items_path(assigns(:line_items))
  end

  test "should show line_items" do
    get :show, :id => line_items(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => line_items(:one).to_param
    assert_response :success
  end

  test "should update line_items" do
    put :update, :id => line_items(:one).to_param, :line_items => { }
    assert_redirected_to line_items_path(assigns(:line_items))
  end

  test "should destroy line_items" do
    assert_difference('LineItems.count', -1) do
      delete :destroy, :id => line_items(:one).to_param
    end

    assert_redirected_to line_items_path
  end
end

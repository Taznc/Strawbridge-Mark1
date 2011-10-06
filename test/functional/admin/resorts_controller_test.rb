require 'test_helper'

class Admin::ResortsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_resorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resort" do
    assert_difference('Admin::Resort.count') do
      post :create, :resort => { }
    end

    assert_redirected_to resort_path(assigns(:resort))
  end

  test "should show resort" do
    get :show, :id => admin_resorts(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_resorts(:one).id
    assert_response :success
  end

  test "should update resort" do
    put :update, :id => admin_resorts(:one).id, :resort => { }
    assert_redirected_to resort_path(assigns(:resort))
  end

  test "should destroy resort" do
    assert_difference('Admin::Resort.count', -1) do
      delete :destroy, :id => admin_resorts(:one).id
    end

    assert_redirected_to admin_resorts_path
  end
end

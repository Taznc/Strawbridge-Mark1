require 'test_helper'

class ProducttagsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:producttags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create producttag" do
    assert_difference('Producttag.count') do
      post :create, :producttag => { }
    end

    assert_redirected_to producttag_path(assigns(:producttag))
  end

  test "should show producttag" do
    get :show, :id => producttags(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => producttags(:one).to_param
    assert_response :success
  end

  test "should update producttag" do
    put :update, :id => producttags(:one).to_param, :producttag => { }
    assert_redirected_to producttag_path(assigns(:producttag))
  end

  test "should destroy producttag" do
    assert_difference('Producttag.count', -1) do
      delete :destroy, :id => producttags(:one).to_param
    end

    assert_redirected_to producttags_path
  end
end

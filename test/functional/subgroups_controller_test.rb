require 'test_helper'

class SubgroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subgroup" do
    assert_difference('Subgroup.count') do
      post :create, :subgroup => { }
    end

    assert_redirected_to subgroup_path(assigns(:subgroup))
  end

  test "should show subgroup" do
    get :show, :id => subgroups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => subgroups(:one).to_param
    assert_response :success
  end

  test "should update subgroup" do
    put :update, :id => subgroups(:one).to_param, :subgroup => { }
    assert_redirected_to subgroup_path(assigns(:subgroup))
  end

  test "should destroy subgroup" do
    assert_difference('Subgroup.count', -1) do
      delete :destroy, :id => subgroups(:one).to_param
    end

    assert_redirected_to subgroups_path
  end
end

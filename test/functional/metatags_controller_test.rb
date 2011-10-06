require 'test_helper'

class MetatagsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:metatags)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_metatag
    assert_difference('Metatag.count') do
      post :create, :metatag => { }
    end

    assert_redirected_to metatag_path(assigns(:metatag))
  end

  def test_should_show_metatag
    get :show, :id => metatags(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => metatags(:one).id
    assert_response :success
  end

  def test_should_update_metatag
    put :update, :id => metatags(:one).id, :metatag => { }
    assert_redirected_to metatag_path(assigns(:metatag))
  end

  def test_should_destroy_metatag
    assert_difference('Metatag.count', -1) do
      delete :destroy, :id => metatags(:one).id
    end

    assert_redirected_to metatags_path
  end
end

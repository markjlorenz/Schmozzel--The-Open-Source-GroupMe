require 'test_helper'

class SchmozzelersControllerTest < ActionController::TestCase
  setup do
    @schmozzeler = schmozzelers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schmozzelers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schmozzeler" do
    assert_difference('Schmozzeler.count') do
      post :create, :schmozzeler => @schmozzeler.attributes
    end

    assert_redirected_to schmozzeler_path(assigns(:schmozzeler))
  end

  test "should show schmozzeler" do
    get :show, :id => @schmozzeler.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @schmozzeler.to_param
    assert_response :success
  end

  test "should update schmozzeler" do
    put :update, :id => @schmozzeler.to_param, :schmozzeler => @schmozzeler.attributes
    assert_redirected_to schmozzeler_path(assigns(:schmozzeler))
  end

  test "should destroy schmozzeler" do
    assert_difference('Schmozzeler.count', -1) do
      delete :destroy, :id => @schmozzeler.to_param
    end

    assert_redirected_to schmozzelers_path
  end
end

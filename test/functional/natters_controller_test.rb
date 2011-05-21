require 'test_helper'

class NattersControllerTest < ActionController::TestCase
  setup do
    @natter = natters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:natters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create natter" do
    assert_difference('Natter.count') do
      post :create, :natter => @natter.attributes
    end

    assert_redirected_to natter_path(assigns(:natter))
  end

  test "should show natter" do
    get :show, :id => @natter.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @natter.to_param
    assert_response :success
  end

  test "should update natter" do
    put :update, :id => @natter.to_param, :natter => @natter.attributes
    assert_redirected_to natter_path(assigns(:natter))
  end

  test "should destroy natter" do
    assert_difference('Natter.count', -1) do
      delete :destroy, :id => @natter.to_param
    end

    assert_redirected_to natters_path
  end
end

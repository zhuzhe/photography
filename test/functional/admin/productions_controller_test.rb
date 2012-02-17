require 'test_helper'

class Admin::ProductionsControllerTest < ActionController::TestCase
  setup do
    @admin_production = admin_productions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_productions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_production" do
    assert_difference('Admin::Production.count') do
      post :create, :admin_production => @admin_production.attributes
    end

    assert_redirected_to admin_production_path(assigns(:admin_production))
  end

  test "should show admin_production" do
    get :show, :id => @admin_production.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_production.to_param
    assert_response :success
  end

  test "should update admin_production" do
    put :update, :id => @admin_production.to_param, :admin_production => @admin_production.attributes
    assert_redirected_to admin_production_path(assigns(:admin_production))
  end

  test "should destroy admin_production" do
    assert_difference('Admin::Production.count', -1) do
      delete :destroy, :id => @admin_production.to_param
    end

    assert_redirected_to admin_productions_path
  end
end

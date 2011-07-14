require 'test_helper'

class FiliaisControllerTest < ActionController::TestCase
  setup do
    @filial = filiais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filiais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filial" do
    assert_difference('Filial.count') do
      post :create, :filial => @filial.attributes
    end

    assert_redirected_to filial_path(assigns(:filial))
  end

  test "should show filial" do
    get :show, :id => @filial.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @filial.to_param
    assert_response :success
  end

  test "should update filial" do
    put :update, :id => @filial.to_param, :filial => @filial.attributes
    assert_redirected_to filial_path(assigns(:filial))
  end

  test "should destroy filial" do
    assert_difference('Filial.count', -1) do
      delete :destroy, :id => @filial.to_param
    end

    assert_redirected_to filiais_path
  end
end

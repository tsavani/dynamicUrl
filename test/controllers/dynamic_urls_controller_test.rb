require 'test_helper'

class DynamicUrlsControllerTest < ActionController::TestCase
  setup do
    @dynamic_url = dynamic_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dynamic_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dynamic_url" do
    assert_difference('DynamicUrl.count') do
      post :create, dynamic_url: { url: @dynamic_url.url }
    end

    assert_redirected_to dynamic_url_path(assigns(:dynamic_url))
  end

  test "should show dynamic_url" do
    get :show, id: @dynamic_url
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dynamic_url
    assert_response :success
  end

  test "should update dynamic_url" do
    patch :update, id: @dynamic_url, dynamic_url: { url: @dynamic_url.url }
    assert_redirected_to dynamic_url_path(assigns(:dynamic_url))
  end

  test "should destroy dynamic_url" do
    assert_difference('DynamicUrl.count', -1) do
      delete :destroy, id: @dynamic_url
    end

    assert_redirected_to dynamic_urls_path
  end
end

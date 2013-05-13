require 'test_helper'

class LinkFindersControllerTest < ActionController::TestCase
  setup do
    @link_finder = link_finders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:link_finders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link_finder" do
    assert_difference('LinkFinder.count') do
      post :create, link_finder: { url: @link_finder.url }
    end

    assert_redirected_to link_finder_path(assigns(:link_finder))
  end

  test "should show link_finder" do
    get :show, id: @link_finder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @link_finder
    assert_response :success
  end

  test "should update link_finder" do
    put :update, id: @link_finder, link_finder: { url: @link_finder.url }
    assert_redirected_to link_finder_path(assigns(:link_finder))
  end

  test "should destroy link_finder" do
    assert_difference('LinkFinder.count', -1) do
      delete :destroy, id: @link_finder
    end

    assert_redirected_to link_finders_path
  end
end

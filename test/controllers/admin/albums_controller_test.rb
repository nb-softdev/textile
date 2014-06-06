require 'test_helper'

class Admin::AlbumsControllerTest < ActionController::TestCase
  setup do
    @album = albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album" do
    assert_difference('Album.count') do
      post :create, album: { code: @album.code, company_id: @album.company_id, description: @album.description, is_active: @album.is_active, name: @album.name }
    end

    assert_redirected_to admin_album_path(assigns(:album))
  end

  test "should show album" do
    get :show, id: @album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album
    assert_response :success
  end

  test "should update album" do
    patch :update, id: @album, album: { code: @album.code, company_id: @album.company_id, description: @album.description, is_active: @album.is_active, name: @album.name }
    assert_redirected_to admin_album_path(assigns(:album))
  end

  test "should destroy album" do
    assert_difference('Album.count', -1) do
      delete :destroy, id: @album
    end

    assert_redirected_to admin_albums_path
  end
end

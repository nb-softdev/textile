require 'test_helper'

class Admin::AlbumProductsControllerTest < ActionController::TestCase
  setup do
    @album_product = album_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_product" do
    assert_difference('AlbumProduct.count') do
      post :create, album_product: { album_id: @album_product.album_id, product_id: @album_product.product_id }
    end

    assert_redirected_to admin_album_product_path(assigns(:album_product))
  end

  test "should show album_product" do
    get :show, id: @album_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_product
    assert_response :success
  end

  test "should update album_product" do
    patch :update, id: @album_product, album_product: { album_id: @album_product.album_id, product_id: @album_product.product_id }
    assert_redirected_to admin_album_product_path(assigns(:album_product))
  end

  test "should destroy album_product" do
    assert_difference('AlbumProduct.count', -1) do
      delete :destroy, id: @album_product
    end

    assert_redirected_to admin_album_products_path
  end
end

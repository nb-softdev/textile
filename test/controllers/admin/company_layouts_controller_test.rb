require 'test_helper'

class Admin::CompanyLayoutsControllerTest < ActionController::TestCase
  setup do
    @company_layout = company_layouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_layouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_layout" do
    assert_difference('CompanyLayout.count') do
      post :create, company_layout: { album_background_color: @company_layout.album_background_color, album_description_font: @company_layout.album_description_font, album_description_font_color: @company_layout.album_description_font_color, album_description_font_size: @company_layout.album_description_font_size, album_name_font: @company_layout.album_name_font, album_name_font_color: @company_layout.album_name_font_color, album_name_font_size: @company_layout.album_name_font_size, company_id: @company_layout.company_id, contact_us_background_color: @company_layout.contact_us_background_color, contact_us_description_font: @company_layout.contact_us_description_font, contact_us_description_font_color: @company_layout.contact_us_description_font_color, contact_us_description_font_size: @company_layout.contact_us_description_font_size, contact_us_name_font: @company_layout.contact_us_name_font, contact_us_name_font_color: @company_layout.contact_us_name_font_color, contact_us_name_font_size: @company_layout.contact_us_name_font_size, footer_background_color: @company_layout.footer_background_color, footer_font: @company_layout.footer_font, footer_font_color: @company_layout.footer_font_color, footer_font_size: @company_layout.footer_font_size, header_background_color: @company_layout.header_background_color, header_font: @company_layout.header_font, header_font_color: @company_layout.header_font_color, header_font_size: @company_layout.header_font_size, home_background_color: @company_layout.home_background_color, home_description_font: @company_layout.home_description_font, home_description_font_color: @company_layout.home_description_font_color, home_description_font_size: @company_layout.home_description_font_size, home_name_font: @company_layout.home_name_font, home_name_font_color: @company_layout.home_name_font_color, home_name_font_size: @company_layout.home_name_font_size, my_work_background_color: @company_layout.my_work_background_color, my_work_description_font: @company_layout.my_work_description_font, my_work_description_font_color: @company_layout.my_work_description_font_color, my_work_description_font_size: @company_layout.my_work_description_font_size, my_work_name_font: @company_layout.my_work_name_font, my_work_name_font_color: @company_layout.my_work_name_font_color, my_work_name_font_size: @company_layout.my_work_name_font_size, what_i_do_background_color: @company_layout.what_i_do_background_color, what_i_do_description_font: @company_layout.what_i_do_description_font, what_i_do_description_font_color: @company_layout.what_i_do_description_font_color, what_i_do_description_font_size: @company_layout.what_i_do_description_font_size, what_i_do_name_font: @company_layout.what_i_do_name_font, what_i_do_name_font_color: @company_layout.what_i_do_name_font_color, what_i_do_name_font_size: @company_layout.what_i_do_name_font_size, who_i_am_background_color: @company_layout.who_i_am_background_color, who_i_am_description_font: @company_layout.who_i_am_description_font, who_i_am_description_font_color: @company_layout.who_i_am_description_font_color, who_i_am_description_font_size: @company_layout.who_i_am_description_font_size, who_i_am_name_font: @company_layout.who_i_am_name_font, who_i_am_name_font_color: @company_layout.who_i_am_name_font_color, who_i_am_name_font_size: @company_layout.who_i_am_name_font_size }
    end

    assert_redirected_to admin_company_layout_path(assigns(:company_layout))
  end

  test "should show company_layout" do
    get :show, id: @company_layout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_layout
    assert_response :success
  end

  test "should update company_layout" do
    patch :update, id: @company_layout, company_layout: { album_background_color: @company_layout.album_background_color, album_description_font: @company_layout.album_description_font, album_description_font_color: @company_layout.album_description_font_color, album_description_font_size: @company_layout.album_description_font_size, album_name_font: @company_layout.album_name_font, album_name_font_color: @company_layout.album_name_font_color, album_name_font_size: @company_layout.album_name_font_size, company_id: @company_layout.company_id, contact_us_background_color: @company_layout.contact_us_background_color, contact_us_description_font: @company_layout.contact_us_description_font, contact_us_description_font_color: @company_layout.contact_us_description_font_color, contact_us_description_font_size: @company_layout.contact_us_description_font_size, contact_us_name_font: @company_layout.contact_us_name_font, contact_us_name_font_color: @company_layout.contact_us_name_font_color, contact_us_name_font_size: @company_layout.contact_us_name_font_size, footer_background_color: @company_layout.footer_background_color, footer_font: @company_layout.footer_font, footer_font_color: @company_layout.footer_font_color, footer_font_size: @company_layout.footer_font_size, header_background_color: @company_layout.header_background_color, header_font: @company_layout.header_font, header_font_color: @company_layout.header_font_color, header_font_size: @company_layout.header_font_size, home_background_color: @company_layout.home_background_color, home_description_font: @company_layout.home_description_font, home_description_font_color: @company_layout.home_description_font_color, home_description_font_size: @company_layout.home_description_font_size, home_name_font: @company_layout.home_name_font, home_name_font_color: @company_layout.home_name_font_color, home_name_font_size: @company_layout.home_name_font_size, my_work_background_color: @company_layout.my_work_background_color, my_work_description_font: @company_layout.my_work_description_font, my_work_description_font_color: @company_layout.my_work_description_font_color, my_work_description_font_size: @company_layout.my_work_description_font_size, my_work_name_font: @company_layout.my_work_name_font, my_work_name_font_color: @company_layout.my_work_name_font_color, my_work_name_font_size: @company_layout.my_work_name_font_size, what_i_do_background_color: @company_layout.what_i_do_background_color, what_i_do_description_font: @company_layout.what_i_do_description_font, what_i_do_description_font_color: @company_layout.what_i_do_description_font_color, what_i_do_description_font_size: @company_layout.what_i_do_description_font_size, what_i_do_name_font: @company_layout.what_i_do_name_font, what_i_do_name_font_color: @company_layout.what_i_do_name_font_color, what_i_do_name_font_size: @company_layout.what_i_do_name_font_size, who_i_am_background_color: @company_layout.who_i_am_background_color, who_i_am_description_font: @company_layout.who_i_am_description_font, who_i_am_description_font_color: @company_layout.who_i_am_description_font_color, who_i_am_description_font_size: @company_layout.who_i_am_description_font_size, who_i_am_name_font: @company_layout.who_i_am_name_font, who_i_am_name_font_color: @company_layout.who_i_am_name_font_color, who_i_am_name_font_size: @company_layout.who_i_am_name_font_size }
    assert_redirected_to admin_company_layout_path(assigns(:company_layout))
  end

  test "should destroy company_layout" do
    assert_difference('CompanyLayout.count', -1) do
      delete :destroy, id: @company_layout
    end

    assert_redirected_to admin_company_layouts_path
  end
end

require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "running")
    @member = Member.create(username: "john", email: "john@example", password: "password", admin: true)
  end


  test "should get categories index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    session[:member_id] = @member.id
    get :new
    assert_response :success 
  end

  test "should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'category.count' do
      post :create, category: { name: "running" }
  end

    assert_redirected_to category_path
  end
end

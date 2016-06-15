require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "cycling")
    @category2 = Category.create(name: "walking")
  end

  test "should should categories listing" do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end


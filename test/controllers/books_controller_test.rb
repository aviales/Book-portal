require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get available" do
    get books_available_url
    assert_response :success
  end

  test "should get reserved" do
    get books_reserved_url
    assert_response :success
  end

  test "should get bought" do
    get books_bought_url
    assert_response :success
  end

end

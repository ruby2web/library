require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  test "books listing" do
    get :index
    assert_response :success # 2xx
    assert assigns(:books)
  end

  test "show a book" do
    get :show, id: books(:steppenwolf).id
    assert_response :success
    assert assigns(:book)
    assert_equal assigns(:book), books(:steppenwolf)
  end

end


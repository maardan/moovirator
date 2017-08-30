require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new, xhr: true
    assert_response :success
  end

  test "should create review" do
    post :create, xhr: true, params: { review: { comment: @review.comment, email: @review.email, movie_id: @review.movie_id, movie_img: @review.movie_img, movie_title: @review.movie_title, rating: @review.rating } }
    assert_response :success
  end

  test "should show review" do
    get :show, params: {id: 1}, xhr: true
    assert_response :success
  end
end
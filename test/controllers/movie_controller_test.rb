require 'test_helper'

class MovieControllerTest < ActionController::TestCase
  test "index action should succeed" do
  	get :index
    assert_response :success
  end
end
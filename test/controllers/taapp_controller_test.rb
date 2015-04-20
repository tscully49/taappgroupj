require 'test_helper'

class TaappControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_not :success
  end

end

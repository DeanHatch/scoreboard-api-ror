require 'test_helper'

class ValidTimesControllerTest < ActionController::TestCase
  setup do
    @competition = competitions(:bball)
    @valid_time = valid_times(:one)
  end

 
  test "should get valid_times index" do
    get competition_valid_times_path(@competition)
    assert_response :success
  end

  test "should create valid_time" do
    assert_difference('ValidTime.unscoped.count') do
      post  competition_valid_times_path(@competition), valid_time: { competition_id: @valid_time.competition_id,
           from_time: 3,
           to_time: 3 }
    end

    assert_redirected_to valid_times_path()
  end

  test "should show valid_time" do
    get :show, id: @valid_time
    assert_response :success
  end
  test "should destroy valid_time" do
    assert_difference('ValidTime.count', -1) do
      delete :destroy, id: @valid_time
    end

    assert_redirected_to valid_times_path
  end
end

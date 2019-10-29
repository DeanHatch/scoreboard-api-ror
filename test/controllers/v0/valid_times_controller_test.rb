require 'test_helper'

class ValidTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competition = competitions(:bball)
    @valid_time = valid_times(:one)
  end

 
  test "should get valid_times index" do
    get v0_competition_valid_times_url(@competition)
    assert_response :success
  end

  test "should create valid_time" do
    assert_difference('ValidTime.unscoped.count') do
      post v0_competition_valid_times_url(@competition),
         params: {valid_time: { competition_id: @competition.id,
           from_time: 3,
           to_time: 3 } }
    end
    assert_response :success
  end

  test "should update valid_time" do
      put v0_valid_time_url(@valid_time),
         params: {valid_time: { from_time: @valid_time.from_time + 12,
           to_time: @valid_time.to_time - 12 } }
    assert_response :success
  end

  test "should update with a patch valid_time" do
      patch v0_valid_time_url(@valid_time),
         params: {valid_time: { from_time: @valid_time.from_time + 12,
           to_time: @valid_time.to_time - 12 } }
    assert_response :success
  end

  test "should show valid_time" do
    get v0_valid_time_url(@valid_time)
    assert_response :success
  end
  
  test "should destroy valid_time" do
    assert_difference('ValidTime.count', -1) do
      delete v0_valid_time_url(@valid_time)
    end
    assert_response :success
  end
end

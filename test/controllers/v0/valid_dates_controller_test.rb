require 'test_helper'

class ValidDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competition = competitions(:bball)
    @valid_date = valid_dates(:bballone)
    #session[:manager_id] = competitions(:bball).id
  end

 
  test "should get valid_dates index" do
    get v0_competition_valid_dates_url(@competition)
    assert_response :success
  end

  test "should create valid_date" do
    assert_difference('ValidDate.unscoped.count') do
      post v0_competition_valid_dates_url(@competition),
                        params: { valid_date: { competition_id: @valid_date.competition_id,
                        			gamedate: @valid_date.gamedate }}
    end
    assert_response :created # more specific than :success
  end

end

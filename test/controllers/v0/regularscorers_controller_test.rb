require 'test_helper'

class RegularscorersControllerTest < ActionDispatch::IntegrationTest
  setup do
      # Remember that there are no Regularcontest fixtures
      # so we get our Regularcontests from the Contests fixtures.
      # This is a testing consequence of Single Table Inheritance.
    @competition = competitions(:bball)
    #session[:manager_id] = competitions(:bball).id()
    @regularcontest = contests(:rcgameone)
  end

  test "should update with valid score" do
    patch v0_regularscorer_url(@regularcontest),
      params: { regularscorer: { homescore: 11 , awayscore: 22 } }
    assert_response :success
  end

  test "should not update with missing score" do
    patch v0_regularscorer_url(@regularcontest),
      params: { regularscorer: { homescore: 11 , awayscore: nil } }
    assert_response :unprocessable_entity
  end

end

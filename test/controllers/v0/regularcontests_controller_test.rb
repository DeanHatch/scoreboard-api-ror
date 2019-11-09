require 'test_helper'

class RegularcontestsControllerTest < ActionDispatch::IntegrationTest
  setup do
      # Remember that there are no Regularcontest fixtures
      # so we get our Regularcontests from the Contests fixtures.
      # This is a testing consequence of Single Table Inheritance.
    @competition = competitions(:bball)
    #session[:manager_id] = competitions(:bball).id()
    @regularcontest = contests(:rcgameone)
  end

  test "should get index" do
    get v0_competition_regularcontests_path(@competition)
    assert_response :success
  end

  test "should create regularcontest" do
    assert_difference('Regularcontest.count') do
      post v0_competition_regularcontests_url(@competition),
            params: { regularcontest: { awaycontestant_id: @regularcontest.awaycontestant_id,
                                        #competition_id: @regularcontest.competition_id,
                                        competition_id: @regularcontest.competition_id,
                                        date: @regularcontest.date,
                                        homecontestant_id: @regularcontest.homecontestant_id,
                                        name: @regularcontest.name,
                                        status: "SCHEDULED",
                                        time: @regularcontest.time,
                                        venue_id: @regularcontest.venue_id } }, as: :json
    end
    assert_response :created # more specific than :success
    puts response.body
  end

  test "should update regularcontest" do
    patch v0_regularcontest_url(@regularcontest),
		params: { regularcontest: {  status: "SCHEDULED" ,
                               homecontestant: {team: @regularcontest.homecontestant.team }, 
                               awaycontestant: {team: @regularcontest.awaycontestant.team } } }
    assert_response :success
  end

  test "should update regularcontest by swapping home and away teams" do
    patch v0_regularcontest_url(@regularcontest),
		params: { regularcontest: {  status: "SCHEDULED" ,
                               homecontestant: {team: @regularcontest.awaycontestant.team }, 
                               awaycontestant: {team: @regularcontest.homecontestant.team } } }
    assert_response :success
  end

  test "should destroy regularcontest" do
    assert_difference('Regularcontest.count', -1) do
      delete v0_regularcontest_url(@regularcontest)
    end
    assert :success
  end
end

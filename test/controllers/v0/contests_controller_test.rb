require 'test_helper'

class ContestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competition = competitions(:bball)
    @contest = contests(:bcgameone)
  end

  test "should get index" do
    get v0_competition_contests_url(@competition), as: :json
    assert_response :success
  end

  test "should create contest" do
    assert_difference('Contest.count') do
      post v0_competition_contests_url(@competition),
            params: { contest: { awaycontestant_id: @contest.awaycontestant_id,
                                 bracketgrouping_id: @contest.bracketgrouping_id, 
                                 competition_id: @contest.competition_id, 
                                 date: @contest.date, 
                                 homecontestant_id: @contest.homecontestant_id, 
                                 name: @contest.name, 
                                 status: @contest.status, 
                                 time: @contest.time, 
                                 type: @contest.type, 
                                 venue_id: @contest.venue_id } }, as: :json
    end

    assert_response 201
  end

  test "should show contest" do
    get v0_contest_url(@contest), as: :json
    assert_response :success
  end

  test "should update contest" do
    patch v0_contest_url(@contest), params: { contest: { awaycontestant_id: @contest.awaycontestant_id, bracketgrouping_id: @contest.bracketgrouping_id, competition_id: @contest.competition_id, date: @contest.date, homecontestant_id: @contest.homecontestant_id, name: @contest.name, status: @contest.status, time: @contest.time, type: @contest.type, venue_id: @contest.venue_id } }, as: :json
    assert_response 200
  end

  test "should destroy contest" do
    assert_difference('Contest.count', -1) do
      delete v0_contest_url(@contest), as: :json
    end

    assert_response 204
  end
end

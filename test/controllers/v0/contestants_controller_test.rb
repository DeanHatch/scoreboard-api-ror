require 'test_helper'

class ContestantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contestant = contestants(:one)
  end

  test "should get index" do
    get contestants_url, as: :json
    assert_response :success
  end

  test "should create contestant" do
    assert_difference('Contestant.count') do
      post contestants_url, params: { contestant: { bcspec_id: @contestant.bcspec_id, bcspec_type: @contestant.bcspec_type, bracketgrouping_id: @contestant.bracketgrouping_id, competition_id: @contestant.competition_id, contest_id: @contestant.contest_id, contest_type: @contestant.contest_type, forfeit: @contestant.forfeit, homeaway: @contestant.homeaway, score: @contestant.score, seeding: @contestant.seeding, team_id: @contestant.team_id, type: @contestant.type } }, as: :json
    end

    assert_response 201
  end

  test "should show contestant" do
    get contestant_url(@contestant), as: :json
    assert_response :success
  end

  test "should update contestant" do
    patch contestant_url(@contestant), params: { contestant: { bcspec_id: @contestant.bcspec_id, bcspec_type: @contestant.bcspec_type, bracketgrouping_id: @contestant.bracketgrouping_id, competition_id: @contestant.competition_id, contest_id: @contestant.contest_id, contest_type: @contestant.contest_type, forfeit: @contestant.forfeit, homeaway: @contestant.homeaway, score: @contestant.score, seeding: @contestant.seeding, team_id: @contestant.team_id, type: @contestant.type } }, as: :json
    assert_response 200
  end

  test "should destroy contestant" do
    assert_difference('Contestant.count', -1) do
      delete contestant_url(@contestant), as: :json
    end

    assert_response 204
  end
end

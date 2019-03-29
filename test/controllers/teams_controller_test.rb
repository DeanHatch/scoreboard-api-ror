require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:heat)
    @grouping = groupings(:bballcon11)
    #session[:manager_id] = competitions(:bball).id()
  end

  test "should get index" do
    get grouping_teams_url(@grouping), as: :json
    assert_response :success
  end

  test "should create team" do
    assert_difference('Team.unscoped.count') do
      post grouping_teams_url(@grouping), params: {team: { competition_id: @team.competition_id, grouping_id: @team.grouping_id, name: @team.name }}
    end

    assert_response :success
  end

  test "should show team" do
    get team_url(@team)
    assert_response :success
  end

  test "should update team" do
    patch team_url(@team), params: {grouping_id: @team.grouping_id,
	team: { competition_id: @team.competition_id, grouping_id: @team.grouping_id, name: @team.name }}
    assert_response :success
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete team_url(@team)
    end

    assert_response :success
  end
end

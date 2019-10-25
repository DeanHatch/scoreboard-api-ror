require 'test_helper'

class V0::TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:heat)
    @grouping = groupings(:bballcon11)
    #session[:manager_id] = competitions(:bball).id()
  end

  test "should get index" do
    get v0_grouping_teams_url(@grouping), as: :json
    assert_response :success
  end

  test "should create team" do
    assert_difference('Team.unscoped.count') do
      post v0_grouping_teams_url(@grouping), params: {team: { competition_id: @team.competition_id, grouping_id: @team.grouping_id, name: @team.name }}
    end

    assert_response :success
  end

  test "should show team" do
    get v0_team_url(@team)
    assert_response :success
  end

  test "should update team" do
    patch v0_team_url(@team), params: {grouping_id: @team.grouping_id,
	team: { grouping_id: @team.grouping_id, name: @team.name }}
    assert_response :success
  end

  test "should destroy team if not contestant" do
      # A newly created Team cannot be a Contestant yet
    post v0_grouping_teams_path(@grouping),
        params: { team: { grouping_id: @grouping.id,
                       	name: "Very Very Temporary"} }
    @newteam = JSON.parse(response.body, object_class: Team)
    assert_difference('Team.count', -1) do
      delete v0_team_url(@newteam)
    end
    assert_response :success
  end

  test "should not destroy team which is a contestant" do
    assert_difference('Team.count', 0) do
      delete v0_team_url(@team)
    end
    assert_response :conflict
  end
end

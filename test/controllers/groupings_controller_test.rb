require 'test_helper'

class GroupingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competition = competitions(:bball)
    @grouping = groupings(:bballdiv1)
    #session[:manager_id] = competitions(:bball).id()
  end

  test "should get index" do
    get competition_groupings_url(@competition), as: :json
    assert_response :success
    #assert_not_nil assigns(:groupings)
  end

  test "should create grouping" do
	# Note that the count must be on the unscoped model
	# because that is what will be counted before the #create method
    assert_difference('Grouping.unscoped.count') do
      post competition_groupings_url(@competition), params: {grouping: { competition_id: @grouping.competition_id,
	name: "Something New", parent_id: @grouping.parent_id } }
    end

    assert_response :success
  end

  test "should show grouping" do
    get grouping_url(@grouping)
    assert_response :success
  end

  test "should update grouping" do
    patch grouping_url(@grouping), params: {grouping: { competition: @competition,
	name: @grouping.name, parent_id: @grouping.parent_id } }
    assert_response :success
  end

  test "should destroy grouping" do
    post competition_groupings_url(@competition), 
        params: {grouping: { competition_id: @grouping.competition_id,
	name: "Deleteable", parent_id: @grouping.parent_id } }
    @newgrouping = JSON.parse(response.body, object_class: Grouping)
      # Let's destroy our newly created Grouping
    assert_difference('Grouping.count', -1) do
      delete grouping_url(@newgrouping)
    end

    assert_response :success
  end
end

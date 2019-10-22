require 'test_helper'

class GroupingplacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groupingplace = groupingplaces(:one)
  end

  test "should get index" do
    get groupingplaces_url, as: :json
    assert_response :success
  end

  test "should create groupingplace" do
    assert_difference('Groupingplace.count') do
      post groupingplaces_url, params: { groupingplace: { grouping_id: @groupingplace.grouping_id, place: @groupingplace.place } }, as: :json
    end

    assert_response 201
  end

  test "should show groupingplace" do
    get groupingplace_url(@groupingplace), as: :json
    assert_response :success
  end

  test "should update groupingplace" do
    patch groupingplace_url(@groupingplace), params: { groupingplace: { grouping_id: @groupingplace.grouping_id, place: @groupingplace.place } }, as: :json
    assert_response 200
  end

  test "should destroy groupingplace" do
    assert_difference('Groupingplace.count', -1) do
      delete groupingplace_url(@groupingplace), as: :json
    end

    assert_response 204
  end
end

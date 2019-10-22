require 'test_helper'

class BcadvancementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bcadvancement = bcadvancements(:one)
  end

  test "should get index" do
    get bcadvancements_url, as: :json
    assert_response :success
  end

  test "should create bcadvancement" do
    assert_difference('Bcadvancement.count') do
      post bcadvancements_url, params: { bcadvancement: { from_contest_id: @bcadvancement.from_contest_id, wl: @bcadvancement.wl } }, as: :json
    end

    assert_response 201
  end

  test "should show bcadvancement" do
    get bcadvancement_url(@bcadvancement), as: :json
    assert_response :success
  end

  test "should update bcadvancement" do
    patch bcadvancement_url(@bcadvancement), params: { bcadvancement: { from_contest_id: @bcadvancement.from_contest_id, wl: @bcadvancement.wl } }, as: :json
    assert_response 200
  end

  test "should destroy bcadvancement" do
    assert_difference('Bcadvancement.count', -1) do
      delete bcadvancement_url(@bcadvancement), as: :json
    end

    assert_response 204
  end
end

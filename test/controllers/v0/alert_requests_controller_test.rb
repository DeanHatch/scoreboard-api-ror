require 'test_helper'

class AlertRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alert_request = alert_requests(:one)
  end

  test "should get index" do
    get alert_requests_url, as: :json
    assert_response :success
  end

  test "should create alert_request" do
    assert_difference('AlertRequest.count') do
      post alert_requests_url, params: { alert_request: { at_domain: @alert_request.at_domain, team_id: @alert_request.team_id, to_dest: @alert_request.to_dest, type: @alert_request.type } }, as: :json
    end

    assert_response 201
  end

  test "should show alert_request" do
    get alert_request_url(@alert_request), as: :json
    assert_response :success
  end

  test "should update alert_request" do
    patch alert_request_url(@alert_request), params: { alert_request: { at_domain: @alert_request.at_domain, team_id: @alert_request.team_id, to_dest: @alert_request.to_dest, type: @alert_request.type } }, as: :json
    assert_response 200
  end

  test "should destroy alert_request" do
    assert_difference('AlertRequest.count', -1) do
      delete alert_request_url(@alert_request), as: :json
    end

    assert_response 204
  end
end

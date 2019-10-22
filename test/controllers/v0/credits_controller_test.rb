require 'test_helper'

class CreditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit = credits(:one)
  end

  test "should get index" do
    get credits_url, as: :json
    assert_response :success
  end

  test "should create credit" do
    assert_difference('Credit.count') do
      post credits_url, params: { credit: { customer_id: @credit.customer_id, type: @credit.type } }, as: :json
    end

    assert_response 201
  end

  test "should show credit" do
    get credit_url(@credit), as: :json
    assert_response :success
  end

  test "should update credit" do
    patch credit_url(@credit), params: { credit: { customer_id: @credit.customer_id, type: @credit.type } }, as: :json
    assert_response 200
  end

  test "should destroy credit" do
    assert_difference('Credit.count', -1) do
      delete credit_url(@credit), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class CreditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:squeakywheel)
    @credit = credits(:eins)
    puts @customer ; puts @credit
    puts self.methods.sort.join('  -  ')
  end

  test "should get index" do
    get customer_credits_url(@customer), as: :json
    assert_response :success
  end

  test "should create credit" do
    assert_difference('Credit.count') do
      post customer_credits_url(@customer), params: { credit: { customer_id: @credit.customer_id, type: @credit.type } }, as: :json
    end

    assert_response 201
  end

  test "should show credit" do
    get customer_credit_url(@customer, @credit), as: :json
    assert_response :success
  end

  test "should update credit" do
    patch customer_credit_url(@customer, @credit), params: { credit: { customer_id: @credit.customer_id, type: @credit.type } }, as: :json
    assert_response 200
  end

  test "should destroy credit" do
    assert_difference('Credit.count', -1) do
      delete customer_credit_url(@customer, @credit), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:countyrec)
  end

  test "should get index" do
    get organizations_url, as: :json
    assert_response :success
  end

  test "should create organization" do
    puts @organization.inspect()
    assert_difference('Organization.count') do
        # Change the name to make the new Organization unique
      post organizations_url, params: { organization: { customer_id: @organization.customer_id,
                                                                               name: "New "+@organization.name,
									       phone: @organization.phone,
									       website: @organization.website } }, as: :json
    end

    assert_response 201
  end

  test "should show organization" do
    get organization_url(@organization), as: :json
    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization), params: { organization: { customer_id: @organization.customer_id, name: @organization.name, phone: @organization.phone, website: @organization.website } }, as: :json
    assert_response 200
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization), as: :json
    end

    assert_response 204
  end
end

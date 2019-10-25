require 'test_helper'

class V0::OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:countyrec)
  end

  test "should get index" do
    get v0_organizations_url, as: :json
    assert_response :success
  end

  test "should create organization" do
    puts @organization.inspect()
    assert_difference('Organization.count') do
        # Change the name to make the new Organization unique
      post v0_organizations_url, params: { organization: { customer_id: @organization.customer_id,
                                                                               name: "New "+@organization.name,
									       phone: @organization.phone,
									       website: @organization.website } }, as: :json
    end

    assert_response 201
  end

  test "should show organization" do
    get v0_organization_url(@organization), as: :json
    assert_response :success
  end

  test "should update organization" do
    patch v0_organization_url(@organization), params: { organization: { customer_id: @organization.customer_id, name: @organization.name, phone: @organization.phone, website: @organization.website } }, as: :json
    assert_response 200
  end

  test "should not destroy organization" do
    assert_difference('Organization.count', 0) do
      delete v0_organization_url(@organization), as: :json
    end

    assert_response :conflict # HTTP STATUS 409
  end
end

require 'test_helper'

class VenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competition = competitions(:bball)
    @venue = venues(:maingym)
    #session[:manager_id] = competitions(:bball).id
  end

  test "should get index" do
    get v0_competition_venues_url(@competition)
    assert_response :success
  end

  test "should create venue" do
      # Use unscoped count to get ALL Venues, not just those for one Competition
    assert_difference('Venue.unscoped.count') do
      post v0_competition_venues_url(@competition),params: {venue: { competition_id: @venue.competition_id, name: @venue.name }}
    end

    assert_response :success
  end

  test "should show venue" do
    get v0_venue_url(@venue)
    assert_response :success
  end

  test "should update venue" do
    patch v0_venue_url(@venue), params: { venue: { competition_id: @venue.competition_id, name: @venue.name }}
    assert_response :success
  end

  test "should not destroy venue due to child(ren)" do
    assert_difference('Venue.count', 0) do
      delete v0_venue_url(@venue)
    end
    assert_response :conflict
  end

  test "should destroy newly created venue since it has no children" do
      # First create
      post v0_competition_venues_url(@competition),
              params: {venue: { competition_id: @venue.competition_id,
	      name: 'New '+@venue.name }}
      @newvenue = JSON.parse(response.body, object_class: Venue)
      # Then destroy
      assert_difference('Venue.count', -1) do
	delete v0_venue_url(@newvenue)
      end
      assert_response :success
    end
end

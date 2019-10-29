require 'test_helper'

class BracketcontestsControllerTest < ActionDispatch::IntegrationTest
  setup do
      # Remember that there are no Bracketcontest fixtures
      # so we get our Regularcontests from the Contests fixtures.
      # This is a testing consequence of Single Table Inheritance.
    @competition = competitions(:bball)
    #session[:manager_id] = competitions(:bball).id()
    @bracketgrouping = Bracketgrouping.find(groupings(:bballdiv1).id()) # cannot use groupings fixtures
    @bracketcontest = contests(:bcgameone)
  end

  test "should get index" do
    get v0_competition_bracketcontests_path(@competition)
    assert_response :success
  end

  test "should create bracketcontest" do
    assert_difference('Bracketcontest.count') do
      post v0_competition_bracketcontests_url(@competition),
            params: { bracketcontest: { homecontestant: {contestantcode: "G" + @bracketgrouping.id.to_s + "P1" }, 
                                        awaycontestant: {contestantcode: "G" + @bracketgrouping.id.to_s + "P2" },
                                        competition_id: @bracketcontest.competition_id,
                                        date: @bracketcontest.date,
                                        name: @bracketcontest.name,
                                        status: "SCHEDULED",
                                        time: @bracketcontest.time,
                                        venue_id: @bracketcontest.venue_id } }, as: :json
    end
    assert_response :created # more specific than :success
  end


  test "should show bracketcontest" do
    get v0_bracketcontest_url(@bracketcontest)
    assert_response :success
  end

  test "should update bracketcontest" do
    patch v0_bracketcontest_url(@bracketcontest),
            params: { bracketgrouping_id: @bracketgrouping.id,
        bracketcontest: { status: "SCHEDULED" }, 
	homecontestant: {contestantcode: @bracketgrouping.all_participant_codes().first() }, 
	awaycontestant: {contestantcode: @bracketgrouping.all_participant_codes().first() } }
    assert_response :success
  end

  test "should destroy bracketcontest" do
    assert_difference('Regularcontest.count', -1) do
      delete v0_bracketcontest_url(@bracketcontest)
    end
    assert :success
  end

end

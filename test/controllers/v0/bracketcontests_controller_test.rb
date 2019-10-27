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
      post :create,   bracketgrouping_id: @bracketgrouping.id,
        bracketcontest: { status: "SCHEDULED" }, 
	homecontestant: {contestantcode: "G" + @bracketgrouping.id.to_s + "P1" }, 
	awaycontestant: {contestantcode: "G" + @bracketgrouping.id.to_s + "P2" }
    puts flash[:alert] + " (" + @bracketgrouping.id.to_s + ")" if flash[:alert]
    end

    # should edit the newly created Bracketcontest
    assert_redirected_to(:action => "edit", :id => assigns(:bracketcontest))
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
    assert_redirected_to bracketgrouping_bracketcontest_path # (assigns(:bracketcontest))
  end

end
  test "should create regularcontest" do
    assert_difference('Regularcontest.count') do
      post v0_competition_regularcontests_url(@competition),
            params: { regularcontest: { awaycontestant_id: @regularcontest.awaycontestant_id,
                                        #competition_id: @regularcontest.competition_id,
                                        competition_id: @regularcontest.competition_id,
                                        date: @regularcontest.date,
                                        homecontestant_id: @regularcontest.homecontestant_id,
                                        name: @regularcontest.name,
                                        status: "SCHEDULED",
                                        time: @regularcontest.time,
                                        venue_id: @regularcontest.venue_id } }, as: :json
    end
    assert_response :created # more specific than :success
  end

  test "should update regularcontest" do
    patch v0_regularcontest_url(@regularcontest),
		params: { regularcontest: {  status: "SCHEDULED" ,
                               homecontestant: {team: @regularcontest.homecontestant.team }, 
                               awaycontestant: {team: @regularcontest.awaycontestant.team } } }
    assert_response :success
  end

  test "should update regularcontest by swapping home and away teams" do
    patch v0_regularcontest_url(@regularcontest),
		params: { regularcontest: {  status: "SCHEDULED" ,
                               homecontestant: {team: @regularcontest.awaycontestant.team }, 
                               awaycontestant: {team: @regularcontest.homecontestant.team } } }
    assert_response :success
  end

  test "should destroy regularcontest" do
    assert_difference('Regularcontest.count', -1) do
      delete v0_regularcontest_url(@regularcontest)
    end
    assert :success
  end

require 'test_helper'

class CompetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    #~ @organization = organizations(:alwaysright)
    #~ session[:organization_id] = @organization.id
    #~ @competition = competitions(:soccer)
    @organization = organizations(:countyrec)
    #session[:organization_id] = @organization.id
    @competition = competitions(:bball)
  end

  test "should get index" do
    get v0_organization_competitions_url(@organization), as: :json
    assert_response :success
  end

  test "should get index across organizations" do
    get v0_competitions_across_organizations_url, as: :json
    assert_response :success
  end

  test "should show competition" do
    get v0_competition_url(@competition.id), as: :json
    assert_response :success
  end

  test "should create competition" do
    assert_difference('Competition.count') do
      post v0_organization_competitions_url(@organization), params: {competition: { organization_id: @competition.organization_id,
						                            drawpoints: @competition.drawpoints,
						                            forfeitlossscore: @competition.forfeitlossscore,
									    forfeitpoints: @competition.forfeitpoints, 	
									    forfeitwinscore: @competition.forfeitwinscore, 
									    keepscores: @competition.keepscores, 
									    losspoints: @competition.losspoints, 
									    name: "The Next "+@competition.name, 
									    playoffbracket: @competition.playoffbracket, 
									    playoffbracketlabel: @competition.playoffbracketlabel, 
									    poolgroupseason: @competition.poolgroupseason, 
									    poolgroupseasonlabel: @competition.poolgroupseasonlabel, 
									    sport: @competition.sport, 
									    variety: @competition.variety, 
									    winpoints: @competition.winpoints }
						}, as: :json
      end
    assert_response :created
  end

  test "patch should update competition" do
    patch v0_competition_url(@competition), params: {competition: { drawpoints: @competition.drawpoints,
                                                                           forfeitlossscore: @competition.forfeitlossscore, 
									   forfeitpoints: @competition.forfeitpoints, 
									   forfeitwinscore: @competition.forfeitwinscore, 
									   keepscores: @competition.keepscores, 
									   losspoints: @competition.losspoints, 
									   name: @competition.name, 
									   playoffbracket: @competition.playoffbracket, 
									   playoffbracketlabel: @competition.playoffbracketlabel, 
									   poolgroupseason: @competition.poolgroupseason, 
									   poolgroupseasonlabel: @competition.poolgroupseasonlabel, 
									   sport: @competition.sport, 
									   variety: @competition.variety, 
									   winpoints: @competition.winpoints } }
    assert_response :success
  end

  test "put should update competition" do
    put v0_competition_url(@competition), params: {competition: { drawpoints: @competition.drawpoints,
                                                                           forfeitlossscore: @competition.forfeitlossscore, 
									   forfeitpoints: @competition.forfeitpoints, 
									   forfeitwinscore: @competition.forfeitwinscore, 
									   keepscores: @competition.keepscores, 
									   losspoints: @competition.losspoints, 
									   name: @competition.name, 
									   playoffbracket: @competition.playoffbracket, 
									   playoffbracketlabel: @competition.playoffbracketlabel, 
									   poolgroupseason: @competition.poolgroupseason, 
									   poolgroupseasonlabel: @competition.poolgroupseasonlabel, 
									   sport: @competition.sport, 
									   variety: @competition.variety, 
									   winpoints: @competition.winpoints } }
    assert_response :success
  end

  test "should not destroy competition" do
    assert_difference('Competition.count', 0) do
      delete v0_competition_url(@competition)
    end

    assert_response :method_not_allowed
  end
end

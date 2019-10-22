class V0::CompetitionsController < V0::ApplicationController
  before_action :set_organization, only: [:index, :create]
  before_action :set_competition, only: [:show, :update, :destroy]

  # GET /organization/1234/competitions
  def index
    @competitions = @organization.competitions

    render json: @competitions
  end

  # GET /competitions
  def index_across_organizations
    @competitions = Competition.all

    render json: @competitions
  end

  # GET /competitions/1
  def show
    render json: @competition
  end

  # POST /competitions
  def create
    @competition = Competition.new(competition_params)

    if @competition.save
      render json: @competition, status: :created, location: @competition
    else
      render json: @competition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /competitions/1
  def update
    if @competition.update(competition_params)
      render json: @competition
    else
      render json: @competition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /competitions/1
  def destroy
    #@competition.destroy
    render json:  "Competitions cannot be deleted.", status: :method_not_allowed
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def for_organization
      @organization = Organization.find(params[:organization_id])
    end

    def set_organization
      #@organization = Organization.find(competition_params[:organization_id])
      @organization = Organization.find(params[:organization_id])
    end

    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def competition_params
      params.require(:competition).permit(:name, :sport, :variety,
                                                             :poolgroupseason, :poolgroupseasonlabel, 
							     :playoffbracket, :playoffbracketlabel, :keepscores, 
							     :winpoints, :drawpoints, :losspoints, :forfeitpoints, 
							     :forfeitwinscore, :forfeitlossscore, 
							     :organization_id, 
							     :hashed_manager_password, :hashed_scorer_password, :salt)
    end
end

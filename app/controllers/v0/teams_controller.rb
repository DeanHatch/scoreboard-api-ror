class V0::TeamsController < V0::ApplicationController
  before_action :set_grouping, only: [:index, :create]
  before_action :set_team, only: [:show, :update, :destroy]

  # GET /teams
  def index
    @teams = @grouping.teams

    render json: @teams
  end

  # GET /teams/1
  def show
    render json: @team
  end

  # POST /teams
  def create
    @team = Team.new(team_params)

    if @team.save
      render json: @team, status: :created, location: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    if @team.contestants.count>0
      render json: 'Cannot Delete this Team. It is a Contestant in at least one Contest.',
              status: :conflict # STATUS=409 if children present
    else
      begin
        @team.destroy
	render json: 'Gone'
      rescue
        render json: @team.errors, status: :unprocessable_entity
      end
    end
    #@team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grouping
      @grouping = Grouping.find(params[:grouping_id])
    end

    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:competition_id, :name, :grouping_id)
    end
end

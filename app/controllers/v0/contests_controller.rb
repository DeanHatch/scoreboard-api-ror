class V0::ContestsController < V0::ApplicationController
  before_action :set_contest, only: [:show, :update, :destroy]

  # GET /contests
  def index
    @contests = Contest.all

    render json: @contests
  end

  # GET /contests/1
  def show
    render json: @contest
  end

  # POST /contests
  def create
    @contest = Contest.new(contest_params)

    if @contest.save
      render json: @contest, status: :created, location: v0_contest_url(@contest)
    else
      render json: @contest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contests/1
  def update
    if @contest.update(contest_params)
      render json: @contest
    else
      render json: @contest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contests/1
  def destroy
    @contest.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contest_params
      params.require(:contest).permit(:competition_id, :type, :date, :time, :venue_id, :status, :homecontestant_id, :awaycontestant_id, :bracketgrouping_id, :name)
    end
end

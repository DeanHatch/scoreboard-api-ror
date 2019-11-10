class V0::RegularcontestsController < V0::ApplicationController
  before_action :set_competition, only: [:index, :create]
  before_action :set_regularcontest, only: [:show, :update, :destroy, :record]

  # GET /regularcontests
  def index
    @regularcontests = @competition.regularcontests

    render json: @regularcontests
  end

  # GET /regularcontests/1
  def show
    render json: @regularcontest
  end

  # POST /regularcontests
  def create
    @regularcontest = Regularcontest.new(regularcontest_params)

    if @regularcontest.save
      render json: @regularcontest, status: :created, location: v0_regularcontest_url(@regularcontest)
    else
      render json: @regularcontest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /regularcontests/1
  def update
    if @regularcontest.update(regularcontest_params)
      render json: @regularcontest
    else
      render json: @regularcontest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /regularcontests/1
  def destroy
    @regularcontest.destroy
  end

  # RECORD /regularcontests/1
  def record
    @regularcontest.record_result(score_params)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    def set_regularcontest
      @regularcontest = Regularcontest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def regularcontest_params
      params.require(:regularcontest).permit(:competition_id, :type, :date, :time, :venue_id, :status, :homecontestant_id, :awaycontestant_id, :bracketgrouping_id, :name)
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:regularcontest).permit(:homescore, :awayscore)
    end

end

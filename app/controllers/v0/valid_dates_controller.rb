class V0::ValidDatesController < V0::ApplicationController
  before_action :set_competition, only: [:index, :create]
  before_action :set_valid_date, only: [:show, :update, :destroy]

  # GET /valid_dates
  def index
    @valid_dates = ValidDate.all

    render json: @valid_dates
  end

  # GET /valid_dates/1
  def show
    render json: @valid_date
  end

  # POST /valid_dates
  def create
    @valid_date = ValidDate.new(valid_date_params)

    if @valid_date.save
      render json: @valid_date, status: :created, location: @valid_date
    else
      render json: @valid_date.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /valid_dates/1
  def update
    if @valid_date.update(valid_date_params)
      render json: @valid_date
    else
      render json: @valid_date.errors, status: :unprocessable_entity
    end
  end

  # DELETE /valid_dates/1
  def destroy
    @valid_date.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    def set_valid_date
      @valid_date = ValidDate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def valid_date_params
      params.require(:valid_date).permit(:gamedate, :competition_id)
    end
end

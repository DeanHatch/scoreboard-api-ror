class V0::ValidTimesController < V0::ApplicationController
  before_action :set_competition, only: [:index, :create]
  before_action :set_valid_time, only: [:show, :update, :destroy]

  # GET /valid_times
  def index
    @valid_times = ValidTime.all

    render json: @valid_times
  end

  # GET /valid_times/1
  def show
    render json: @valid_time
  end

  # POST /valid_times
  def create
    @valid_time = ValidTime.new(valid_time_params)

    if @valid_time.save
      render json: @valid_time, status: :created, location: @valid_time
    else
      render json: @valid_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /valid_times/1
  def update
    if @valid_time.update(valid_time_params)
      render json: @valid_time
    else
      render json: @valid_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /valid_times/1
  def destroy
    @valid_time.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    def set_valid_time
      @valid_time = ValidTime.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def valid_time_params
      params.require(:valid_time).permit(:competition_id, :from_time, :to_time)
    end
end

class V0::GroupingplacesController < V0::ApplicationController
  before_action :set_groupingplace, only: [:show, :update, :destroy]

  # GET /groupingplaces
  def index
    @groupingplaces = Groupingplace.all

    render json: @groupingplaces
  end

  # GET /groupingplaces/1
  def show
    render json: @groupingplace
  end

  # POST /groupingplaces
  def create
    @groupingplace = Groupingplace.new(groupingplace_params)

    if @groupingplace.save
      render json: @groupingplace, status: :created, location: @groupingplace
    else
      render json: @groupingplace.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groupingplaces/1
  def update
    if @groupingplace.update(groupingplace_params)
      render json: @groupingplace
    else
      render json: @groupingplace.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groupingplaces/1
  def destroy
    @groupingplace.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupingplace
      @groupingplace = Groupingplace.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def groupingplace_params
      params.require(:groupingplace).permit(:grouping_id, :place)
    end
end

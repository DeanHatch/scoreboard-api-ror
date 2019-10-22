class GroupingsController < ApplicationController
  before_action :set_competition, only: [:index, :create]
  before_action :set_grouping, only: [:show, :update, :destroy]

  # GET /groupings
  def index
    @groupings = @competition.groupings

    render json: @groupings
  end

  # GET /groupings/1
  def show
    render json: @grouping
  end

  # POST /groupings
  def create
    @grouping = Grouping.new(grouping_params)

    if @grouping.save
      render json: @grouping, status: :created, location: @grouping
    else
      render json: @grouping.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groupings/1
  def update
    if @grouping.update(grouping_params)
      render json: @grouping
    else
      render json: @grouping.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groupings/1
  def destroy
    @grouping.destroy if ! (@grouping.has_groupings? || @grouping.has_teams?)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    def set_grouping
      @grouping = Grouping.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grouping_params
      params.require(:grouping).permit(:competition_id, :name, :parent_id, :bracket_grouping)
    end
end

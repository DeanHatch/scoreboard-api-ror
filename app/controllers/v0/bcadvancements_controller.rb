class BcadvancementsController < ApplicationController
  before_action :set_bcadvancement, only: [:show, :update, :destroy]

  # GET /bcadvancements
  def index
    @bcadvancements = Bcadvancement.all

    render json: @bcadvancements
  end

  # GET /bcadvancements/1
  def show
    render json: @bcadvancement
  end

  # POST /bcadvancements
  def create
    @bcadvancement = Bcadvancement.new(bcadvancement_params)

    if @bcadvancement.save
      render json: @bcadvancement, status: :created, location: @bcadvancement
    else
      render json: @bcadvancement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bcadvancements/1
  def update
    if @bcadvancement.update(bcadvancement_params)
      render json: @bcadvancement
    else
      render json: @bcadvancement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bcadvancements/1
  def destroy
    @bcadvancement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bcadvancement
      @bcadvancement = Bcadvancement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bcadvancement_params
      params.require(:bcadvancement).permit(:from_contest_id, :wl)
    end
end

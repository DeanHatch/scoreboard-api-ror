class AlertRequestsController < ApplicationController
  before_action :set_alert_request, only: [:show, :update, :destroy]

  # GET /alert_requests
  def index
    @alert_requests = AlertRequest.all

    render json: @alert_requests
  end

  # GET /alert_requests/1
  def show
    render json: @alert_request
  end

  # POST /alert_requests
  def create
    @alert_request = AlertRequest.new(alert_request_params)

    if @alert_request.save
      render json: @alert_request, status: :created, location: @alert_request
    else
      render json: @alert_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alert_requests/1
  def update
    if @alert_request.update(alert_request_params)
      render json: @alert_request
    else
      render json: @alert_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alert_requests/1
  def destroy
    @alert_request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert_request
      @alert_request = AlertRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alert_request_params
      params.require(:alert_request).permit(:type, :to_dest, :at_domain, :team_id)
    end
end

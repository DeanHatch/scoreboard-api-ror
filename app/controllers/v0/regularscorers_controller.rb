class V0::RegularscorersController < V0::ApplicationController
  before_action :set_regularcontest, only: [:update]

  # UPDATE /regularcontests/1
  def update
    begin
      @regularcontest.record_result(params[:regularscorer][:homescore], params[:regularscorer][:awayscore])
      render json: @regularcontest
    rescue => what_went_wrong
      #render json: @regularcontest.errors, status: :unprocessable_entity
      render json: what_went_wrong.message(), status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regularcontest
      @regularcontest = Regularcontest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:regularscorer).permit(:homescore, :awayscore)
    end

end

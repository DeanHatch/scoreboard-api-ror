class V0::VenuesController < V0::ApplicationController
  before_action :set_competition, only: [:index, :create]
  before_action :set_venue, only: [:show, :update, :destroy]

  # GET /venues
  def index
    @venues = @competition.venues

    render json: @venues
  end

  # GET /venues/1
  def show
    render json: @venue
  end

  # POST /venues
  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      render json: @venue, status: :created, location: @venue
    else
      render json: @venue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /venues/1
  def update
    if @venue.update(venue_params)
      render json: @venue
    else
      render json: @venue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /venues/1
  #  Note that there is a Foreign Key constraint in the database
  #  which will prevent this from executing if there are any children.
  def destroy
    if @venue.contests.count>0
      render json: 'Cannot Delete this Venue. Contests are scheduled there.',
              status: :conflict # STATUS=409 if children present
    else
      begin
        @venue.destroy
	render json: 'Gone'
      rescue
        render json: @venue.errors, status: :unprocessable_entity
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def venue_params
      params.require(:venue).permit(:name, :competition_id)
    end
end

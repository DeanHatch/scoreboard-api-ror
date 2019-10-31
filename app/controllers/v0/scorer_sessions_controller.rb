class V0::ScorerSessionsController < V0::ApplicationController
  before_action :set_competition, only: [:create]
  before_action :set_scorer, only: [:destroy]

  def create
    scorer_pin = params[:session][:pin]
    #scorer = scorer_email.present? && User.find_by(email: scorer_email)

    if @competition.valid_scorer_pin? scorer_pin
      #sign_in scorer, store: false
      scorer = Scorer.new(@competition)
      scorer.generate_authentication_token!
      scorer.save
      render json: scorer, status: 200, location: [:api, scorer]
    else
      render json: { errors: "Invalid PIN" }, status: 422
    end
  end

  def destroy
  end

  private

  def set_competition
  end

  def validate_scorer
  end

end

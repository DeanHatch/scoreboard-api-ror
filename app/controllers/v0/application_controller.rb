class ApplicationController < ActionController::API
    # added 3/5/2019
  include ActionController::Helpers
  include ActionController::Flash
  
  
  # GET /organizations
  def index
    @organizations = Organization.all

    render json: {organizations: @organizations.collect{|o| o.name}}
  end
end

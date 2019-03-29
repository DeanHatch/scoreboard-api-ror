Rails.application.routes.draw do
  
  resources :organizations do
    resources :competitions, shallow: true do
      resources :groupings, shallow: true do
	resources :teams, shallow: true
      end  # end of groupings resources
      resources :venues
      resources :valid_dates
      resources :valid_times
    end  # end of competitions resources
  end

    # Non-nested route to handle case where all Competitions
    # across all Organizations are requested
  get 'competitions',
          to: 'competitions#index_across_organizations', 
	  as: :competitions_across_organizations

  #get 'competitions/:competition_id/teams',
  #        to: 'teams#index_for_competition', 
#	  as: :teams_for_competition
  
  
  resources :contests
  resources :contestants
  resources :bcadvancements
  resources :groupingplaces
  resources :credits
  resources :alert_requests
  
  devise_for :customers, controllers: {sessions: 'customers/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#index"
end

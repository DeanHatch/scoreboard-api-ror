Rails.application.routes.draw do

  concern :api do
      resources :organizations do
	resources :competitions, shallow: true do
	  resources :groupings, shallow: true do
	    resources :teams, shallow: true do
	      resources :alert_requests, shallow: true 
	    end # of teams resources
	  end  # end of groupings resources
	  resources :contests
	  resources :regularcontests
	  resources :bracketcontests
	  resources :contestants, only: [:index, :show]
	  resources :venues
	  resources :valid_dates
	  resources :valid_times
  
  resources :bcadvancements
  resources :groupingplaces
  
	end  # end of competitions resources
      end  # of organizations resources
      
      # Non-nested route to handle case where all Competitions
      # across all Organizations are requested
      get 'competitions',
          to: 'competitions#index_across_organizations', 
         as: :competitions_across_organizations
     end  # of api concern
    
    namespace :v0 do
      concerns :api
      end  # of v0 namespace
     
       #get 'competitions/:competition_id/teams',
       #        to: 'teams#index_for_competition', 
       #	  as: :teams_for_competition
       
  devise_for :customers, controllers: {sessions: 'customers/sessions' }, defaults: { format: :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers do
    resources :credits
    end
  
  root to: "application#index"
end

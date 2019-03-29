class Contestant < ActiveRecord::Base
	
	belongs_to :competition
	belongs_to :contest
	  # Team is optional. It can be assigned at a later date.
	belongs_to :team, optional: true

	delegate :competition, to: :contest   
	delegate :manager, to: :contest   
   
	
	 # Returns instance of a descendant of Contestant class that is the
	 # other contestant in the Contest with this Contestant.
	def opponent
		homeaway=='H' ? self.contest.awaycontestant : self.contest.homecontestant
	end
	
	# A Win is a Win...
	def win()
	  return false if (self.score.nil? or self.opponent.score.nil?)
	  self.score() ? self.score().to_i > self.opponent.score().to_i : false
	end
	
	# But a Loss is a whole other thing...
	def loss()
	  return false if (self.score.nil? or self.opponent.score.nil?)
	  self.score() ? self.score() < self.opponent.score() : false
	end
	
	# Draws (when used) are when the scores are equal.
	def draw()
		self.score() ? self.score() == self.opponent.score() : false
	end
	
	
  
  def teamname
	  team_id ? Team.find(team_id).name : 'TBD'
  end
  
  def fullname
	  self.teamname()
  end
  
end

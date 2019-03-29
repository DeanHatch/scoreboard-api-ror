class Grouping < ApplicationRecord
  
  	
	belongs_to :manager, foreign_key: "competition_id"
	belongs_to :competition, foreign_key: "competition_id"
	validates_presence_of :competition_id
	
	belongs_to :grouping,
 	                    foreign_key: "parent_id", 
			    class_name: "Grouping", 
			    optional: true
	#validates_presence_of :parent_id # ignore when creating root Grouping for a Competition
	has_many :groupings, foreign_key: "parent_id",
					class_name: "Grouping" # making default explicit

	has_many :teams, foreign_key: "grouping_id",
					class_name: "Team"  # making default explicit
	has_many :contests, through: :teams

 
	# (Recursive) Return an Array with this Grouping appended to the end of the Array returned by
	# sending this method to the parent of this Grouping.
	def hierarchy()
		#  self.grouping is the Parent Gouping (if any) of this Grouping
	  self.grouping ? self.grouping.hierarchy << self.name : [self.name]
	end

	# Concatenated names from very top down to this Grouping.
	def fullname()
		self.hierarchy.join(' ')
	end
		
	# Return true iff there exists at least one Grouping that identifies this as its Parent.
	def has_groupings?()
		self.groupings.count>0
	end
	
	# Return true iff there exists at least one Team that identifies this as its Grouping.
	def has_teams?()
		self.teams.count>0
	end
	
	# Groupings directly within this Grouping plus Groupings within any descendants of
	# this Grouping.
	def all_groupings()
		(self.groupings + self.groupings.collect{|sg| sg.all_groupings()}).flatten
	end
	
	# Teams directly within this Grouping plus Teams within any descendants of
	# this Grouping. Ordinarily there will be one or the other but not both. This
	# will handle the case where there is one or the other or both.
	def all_teams()
		(self.teams + self.groupings.collect{|sg| sg.all_teams()}).flatten
	end
	
	def as_bracketgrouping()
		 self.bracket_grouping ? Bracketgrouping.find(self.id) : Bracketgrouping.new() 
	end
	
	
	# Return an Array of all Contests for which any Team
	# in this Grouping is the Team.
	def unique_contests()
		((self.all_groupings << self).collect{|g| g.contests }).flatten.uniq
	end
end

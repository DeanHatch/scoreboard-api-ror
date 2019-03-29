class ValidTime < ApplicationRecord
	
  belongs_to :competition, foreign_key: "competition_id"
  belongs_to :manager, foreign_key: "competition_id"
  validates_presence_of :competition_id
  belongs_to :grouping, foreign_key: "grouping_id"
  belongs_to :venue, foreign_key: "venue_id"

     # Return a ValidTime object that spans the entire day.
     # This can be used for selection lists if no specific start
     # times have been identified.
  def self.default()
    vt = self.new
    vt.from_time=GameTime.earliest()
    vt.to_time = GameTime.latest()
    vt
  end

    # Returns an array of HTML Select Element Options
  def select_options()
    (self.from_time..self.to_time).to_a.collect{|t| [GameTime.new(t).to_s, t.to_s]}
  end
      
    # Convenience method with default if nil.
  def grouping_name()
    self.grouping_id ? Grouping.find(self.grouping_id).fullname : 'All'
  end

    # Convenience method with default if nil.
  def venue_name()
    self.venue_id ? Venue.find(self.venue_id).name : 'All'
  end
  
    # Use GameTime class to format beginning of time range.
  def display_from_time
    GameTime.new(self.from_time).to_s
  end
  
    # Use GameTime class to format ending of time range.
  def display_to_time
    GameTime.new(self.to_time).to_s
  end

end

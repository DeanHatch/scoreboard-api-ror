class ValidTime < ApplicationRecord
  belongs_to :competition
  belongs_to :manager, foreign_key: "competition_id"
  
  validates :from_time, inclusion: { in: 1..287,
    message: "%{value} is not a valid start time value" }
  
  validates :to_time, inclusion: { in: 1..287,
    message: "%{value} is not a valid end time value" }
  
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
      
    # Use GameTime class to format beginning of time range.
  def display_from_time
    GameTime.new(self.from_time).to_s
  end
  
    # Use GameTime class to format ending of time range.
  def display_to_time
    GameTime.new(self.to_time).to_s
  end

end

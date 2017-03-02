module SteemData
  module ActsAsTemporal
    def self.included(base)
      base.scope :starting, lambda { |with, not_inverted = true|
        r = where(:timestamp.gt => with, :timestamp.lt => Time.now)
        
        not_inverted ? r : where(:_id.nin => r.distinct(:_id))
      }
      
      base.scope :ending, lambda { |with, not_inverted = true|
        r = where(:timestamp.gt => Time.at(0), :timestamp.lt => with)
        
        not_inverted ? r : where(:_id.nin => r.distinct(:_id))
      }
      
      base.scope :today, -> { starting(1.day.ago) }
      base.scope :yesterday, -> { starting(2.days.ago).starting(1.day.ago, false) }
    end
  end
end

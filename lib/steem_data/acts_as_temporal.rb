module SteemData
  module ActsAsTemporal
    def self.included(base)
      base.scope :starting, lambda { |with, field = :timestamp, not_inverted = true|
        r = where(field.gt => with, field.lt => Time.now.utc)
        
        not_inverted ? r : where(:_id.nin => r.distinct(:_id))
      }
      
      base.scope :ending, lambda { |with, field = :timestamp, not_inverted = true|
        r = where(field.gt => Time.at(0), field.lt => with)
        
        not_inverted ? r : where(:_id.nin => r.distinct(:_id))
      }
      
      base.scope :today, -> { starting(1.day.ago.utc) }
      base.scope :yesterday, -> { starting(2.days.ago.utc).starting(1.day.ago.utc, :timestamp, false) }
    end
  end
end

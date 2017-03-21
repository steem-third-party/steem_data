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
      
      base.scope :betwixt, lambda { |starting, ending, field = :timestamp, not_inverted = true|
        r = where(field.gt => starting, field.lt => ending)
        
        not_inverted ? r : where(:_id.nin => r.distinct(:_id))
      }
      
      base.scope :today, lambda { |field = :timestamp|
        starting(1.day.ago.utc, field)
      }
      
      base.scope :yesterday, lambda { |field = :timestamp|
        betwixt(2.days.ago.utc, 1.day.ago.utc, field)
      }
    end
  end
end

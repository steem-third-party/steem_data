require 'test_helper'

module SteemData
  class AccountOperationTest < SteemData::Test
    def test_average_vote_weight
      result = SteemData::AccountOperation.type('vote').yesterday.average(:weight)
      refute_equal 0, result
    end
    
    def test_today
      op = SteemData::AccountOperation.type('vote').today.last
      refute_nil op
    end
    
    def test_ending
      op = SteemData::AccountOperation.type('vote').ending(2.days.ago).last
      refute_nil op
    end
  end
end

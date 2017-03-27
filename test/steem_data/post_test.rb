require 'test_helper'

module SteemData
  class PostTest < SteemData::Test
    def test_commented_on
      post = SteemData::Post.find_by(author: 'steemit', permlink: 'firstpost')
      refute_nil post
      refute post.commented_on?('dantheman')
    end
    
    def test_by_cashout
      post = SteemData::Post.by_cashout.last
      refute_nil post
    end
  end
end

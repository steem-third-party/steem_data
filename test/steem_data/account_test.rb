require 'test_helper'

module SteemData
  class AccountTest < SteemData::Test
    def test_proxied
      account = SteemData::Account.find_by(name: 'freedom')
      refute_nil account
      proxied = account.proxied
      assert_equal [], proxied
    end
    
    def test_routed
      account = SteemData::Account.find_by(name: 'freedom')
      refute_nil account
      routed = account.routed
      refute_equal [], routed
    end
    
    def test_routed_2
      account = SteemData::Account.find_by(name: 'thecyclist')
      refute_nil account
      routed = account.routed
      refute_equal [], routed
    end
    
    def test_search
      account = SteemData::Account.search('steemit').last
      refute_nil account
    end
    
    def test_search_regex
      account = SteemData::Account.search(/steemit/).last
      refute_nil account
    end
  end
end

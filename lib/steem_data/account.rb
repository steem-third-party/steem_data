module SteemData
  class Account
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include ActsAsMathematical
    include ActsAsTemporal
    store_in collection: 'Accounts'
    
    scope :mined, lambda { |mined = true| where(mined: mined) }
    scope :search, lambda { |search|
      case search.class
      when Regexp then where(name: search)
      else; where(name: {'$regex' => ".*#{search.to_s.downcase}.*"})
      end
    }

    def following_accounts; Account.where(:name.in => following); end
    def follower_accounts; Account.where(:name.in => followers); end
    def posts; Post.where(author: name); end
    def proxied_accounts; Account.where(:name.in => proxied); end
    def routed_accounts; Account.where(:name.in => routed); end
    
    def proxied
      proxied = []
      
      # List of accounts that have used this account as a proxy.
      accounts = AccountOperation.type('account_witness_proxy').where(proxy: name).
        distinct(:account) - [name]
      
      # Related operations (either voting for this account or resetting).
      account_witness_proxies = AccountOperation.type('account_witness_proxy').
        where(:account.in => accounts, :proxy.in => ['', name]).
        order_by(timestamp: :asc)
      
      # Replay the proxy selection related to this account.  Note, this
      # iteration will even work if the full proxy history is replayed, because
      # we are only looking for "this account" or "not this account" in the
      # order that those operations appear on the blockchain.
      account_witness_proxies.each do |b|
        if b.proxy == name
          proxied += [b.account]
        else
          proxied -= [b.account]
        end
        
        proxied = proxied.uniq
      end
      
      proxied
    end
    
    def routed
      routed = []
      
      # List of accounts that have used this account to route withrdrawn vests.
      accounts = AccountOperation.type('set_withdraw_vesting_route').where(to_account: name).
        distinct(:account) - [name]
      
      # Related operations (either setting this account or resetting).
      routes = AccountOperation.type('set_withdraw_vesting_route').
        where(:account.in => accounts, to_account: name).
        order_by(timestamp: :asc)
      
      # Like proxied, we replay the proxy selection related to this account.
      routes.each do |b|
        if b.to_account == name && b.percent > 0
          routed += [b.account]
        else
          routed -= [b.account]
        end
        
        routed = routed.uniq
      end
      
      routed
    end
  end
end

module SteemData
  class Account
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include ActsAsMathematical
    include ActsAsTemporal
    store_in collection: 'Accounts'

    def following_accounts; Account.where(:name.in => following); end
    def follower_accounts; Account.where(:name.in => followers); end
    def posts; Post.where(author: name); end
    def proxied_accounts; Account.where(:name.in => proxied); end
    
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
  end
end

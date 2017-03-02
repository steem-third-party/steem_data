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
    def proxy_accounts; Account.where(:name.in => proxies); end

    def proxies
      AccountOperation.type('account_witness_proxy').where(proxy: name).
        distinct('account')
    end
  end
end

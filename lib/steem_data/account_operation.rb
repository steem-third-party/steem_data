module SteemData
  class AccountOperation
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include ActsAsOperation
    include ActsAsMathematical
    include ActsAsTemporal
    store_in collection: 'AccountOperations'
    
    scope :account, lambda { |account| where(account: account) }
  end
end

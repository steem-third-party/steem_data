module SteemData
  class PriceHistory
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include ActsAsMathematical
    include ActsAsTemporal
    store_in collection: 'PriceHistory'
  end
end
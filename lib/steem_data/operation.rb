module SteemData
  class Operation
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include ActsAsOperation
    include ActsAsMathematical
    include ActsAsTemporal
    store_in collection: 'Operations'
  end
end

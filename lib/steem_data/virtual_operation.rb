module SteemData
  class VirtualOperation
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include ActsAsMathematical
    include ActsAsTemporal
    store_in collection: 'VirtualOperations'
  end
end
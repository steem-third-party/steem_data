module SteemData
  class Setting
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include ActsAsMathematical
    include ActsAsTemporal
    store_in collection: 'settings'
  end
end
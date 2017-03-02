module SteemData
  class Stat
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include ActsAsMathematical
    include ActsAsTemporal
    store_in collection: 'stats'
  end
end
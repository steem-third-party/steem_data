require 'mongoid'

module SteemData
  require 'steem_data/acts_as_mathematical'
  require 'steem_data/acts_as_operation'
  require 'steem_data/acts_as_temporal'
  require 'steem_data/account_operation'
  require 'steem_data/account'
  require 'steem_data/operation'
  require 'steem_data/post'
  require 'steem_data/price_history'
  require 'steem_data/setting'
  require 'steem_data/stat'
  require 'steem_data/virtual_operation'
  require 'steem_data/version'
  extend self
  
  def load(path = nil, run_level = :production)
    Mongoid.load!("#{File.dirname(__FILE__)}/../config/mongoid.yml", run_level)
  end
end

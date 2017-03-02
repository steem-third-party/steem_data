module SteemData
  module ActsAsMathematical
    def self.included(base)
      def base.average(key)
        sum(key) / count
      end
    end
  end
end
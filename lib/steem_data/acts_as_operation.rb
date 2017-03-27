module SteemData
  module ActsAsOperation
    def self.included(base)
      base.scope :type, lambda { |type, invert = false|
        where((invert ? :type.nin : :type.in) => [type].flatten)
      }
      base.scope :block_num, lambda { |block_num| where(block_num: block_num) }
      base.scope :author, lambda { |author| where(author: author) }
      
      base.scope :vote, -> { type 'vote' }
      base.scope :upvote, lambda { |min_vote = 0| vote.where(:weight.gt => min_vote) }
      base.scope :downvote, lambda { |max_vote = 0| vote.where(:weight.lt => max_vote) }
      base.scope :unvote, lambda { vote.where(weight: 0) }
      base.scope :voter, lambda { |voter| vote.where(voter: voter) }
      
      # base.scope :comment, -> { type 'comment' }
      base.scope :parent_permlink, lambda { |parent_permlink| where(parent_permlink: parent_permlink) }
      base.scope :parent_author, lambda { |parent_author| where(parent_author: parent_author) }
      base.scope :permlink, lambda { |permlink| where(permlink: permlink) }
      base.scope :tag, lambda { |tag| where('json_metadata.tags' => tag) }
      
      base.scope :transfer, -> { type 'transfer' }
    end
  end
end

class Connection < ActiveRecord::Base
  belongs_to :beeper, :class_name => 'User'
  belongs_to :follower, :class_name => 'User'

  validates_uniqueness_of :beeper_id, scope: :follower_id
end

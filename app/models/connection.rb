class Connection < ActiveRecord::Base
  belongs_to :beeper, :class_name => 'User'
  belongs_to :follower, :class_name => 'User'
end

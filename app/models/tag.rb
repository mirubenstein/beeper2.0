class Tag < ActiveRecord::Base
  belongs_to :user
  belongs_to :beep
  validates_uniqueness_of :user_id, scope: :beep_id
end

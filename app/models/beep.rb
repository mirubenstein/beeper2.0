class Beep < ActiveRecord::Base
  validates :beep, presence: true
  belongs_to :user

  default_scope { order('created_at DESC') }
end

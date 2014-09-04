class Beep < ActiveRecord::Base
  validates :beep, presence: true
  belongs_to :user
end

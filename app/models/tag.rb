class Tag < ActiveRecord::Base
  belongs_to :user
  belongs_to :beep
  validates_uniqueness_of :user_id, scope: :beep_id

  after_create :send_tag_notification

  def send_tag_notification
    UserMailer.tag_notification(self.user, self.beep).deliver
  end
end

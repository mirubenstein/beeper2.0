class Beep < ActiveRecord::Base
  validates :beep, presence: true
  belongs_to :user
  has_many :tags
  has_many :users, through: :tags

  default_scope { order('created_at DESC') }

  after_save :name_checker

private
  def name_checker
    names = []
    User.all.each do |user|
      if self.beep.match("~" + user.name)
        names << self.beep.match("~" + user.name).to_s.slice(1..-1)
      end
    end
    names.each do |name|
      self.tags.create(user_id: User.find_by(name: name).id)
    end
  end
end

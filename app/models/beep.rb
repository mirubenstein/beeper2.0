class Beep < ActiveRecord::Base
  validates :beep, presence: true
  belongs_to :user
  has_many :tags
  has_many :users, through: :tags

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  default_scope { order('created_at DESC') }

  after_create :name_checker

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

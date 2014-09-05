class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true

  after_create :send_welcome_message #, other callbacks..

  has_many :beeps, dependent: :destroy

  has_many :connections, foreign_key: 'follower_id', dependent: :destroy
  has_many :beepers, through: :connections, source: :beeper
  has_many :reverse_connections, foreign_key: 'beeper_id', class_name: 'Connection', dependent: :destroy
  has_many :followers, through: :reverse_connections, source: :follower

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end

  def feed
    beepers_beeps = []
    self.beepers.each do |beeper|
      beepers_beeps << beeper.beeps
    end
    binding.pry
    beepers_beeps.flatten
  end

  def following? user
    Connection.find_by({beeper_id: user.id, follower_id: self.id})
  end

  def follow user
    Connection.create({beeper_id: user.id, follower_id: self.id})
  end

  def unfollow user
    Connection.find_by({beeper_id: user.id, follower_id: self.id}).destroy
  end

end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true

  after_create :send_welcome_message #, other callbacks..

  has_many :beeps

  has_many :connections
  has_many :beepers, through: :connections, source: :followers
  has_many :followers, through: :connections, source: :beepers
  has_many :followers, class_name: 'Connection', foreign_key: 'beeper_id'
  has_many :beepers, class_name: 'Connection', foreign_key: 'follower_id'

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end
end


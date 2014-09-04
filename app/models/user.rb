class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true

  after_create :send_welcome_message #, other callbacks..

  has_many :beeps

def send_welcome_message
  UserMailer.signup_confirmation(self).deliver
end
end


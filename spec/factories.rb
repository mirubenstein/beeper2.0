FactoryGirl.define do
  factory :user do
    name "blnkt"
    email "blnkt@blnkt.com"
    password "password"
    password_confirmation "password"
  end

  factory :beep do
    beep "the raven flies at midnight"
  end
end

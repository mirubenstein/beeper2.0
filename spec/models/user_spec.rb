require 'rails_helper'

describe User do
  it "sends an email when the user is created" do
    DatabaseCleaner.clean
    user = FactoryGirl.create(:user)
    expect(ActionMailer::Base.deliveries.last.to).to eq [user.email]
  end
end

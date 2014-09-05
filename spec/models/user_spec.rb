require 'rails_helper'

describe User do
  before :each do
    DatabaseCleaner.clean
    @awesome = FactoryGirl.create(:user, name: "awesome", email: "awesome@awesome.com")
    @moof = FactoryGirl.create(:user, name: "moof", email: "moof@moof.com")
    @user = FactoryGirl.create(:user)
  end

  it "sends an email when the user is created" do
    expect(ActionMailer::Base.deliveries.last.to).to eq [@user.email]
  end

  it { should have_many :beeps }
  it { should have_many :followers }
  it { should have_many :beepers }

  it "allows a user to follow another user" do
    Connection.create({follower_id: @awesome.id, beeper_id: @user.id})
    Connection.create({follower_id: @moof.id, beeper_id: @user.id})
    expect(@user.followers.first.follower).to eq @awesome
  end
end

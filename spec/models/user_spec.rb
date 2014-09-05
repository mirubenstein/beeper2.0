require 'rails_helper'

describe User do
  before :each do
    DatabaseCleaner.clean
    @awesome = FactoryGirl.create(:user, name: "awesome", email: "awesome@awesome.com")
    @moof = FactoryGirl.create(:user, name: "moof", email: "moof@moof.com")
    @user = FactoryGirl.create(:user)
    @moof_beep = FactoryGirl.create(:beep, user_id: @moof.id)
    @awesome_beep = FactoryGirl.create(:beep, user_id: @awesome.id)
  end

  it "sends an email when the user is created" do
    expect(ActionMailer::Base.deliveries.first.to).to eq [@user.email]
  end

  it { should have_many :beeps }
  it { should have_many :followers }

  it "allows a user to follow another user" do
    @moof.follow(@user)
    expect(@user.followers).to eq [@moof]
  end

  it "allows a user to unfollow another user" do
    @moof.follow(@user)
    @awesome.follow(@user)
    @moof.unfollow(@user)
    expect(@user.followers).to eq [@awesome]
  end

  it "shows all beeps of a users followers" do
    @user.follow(@awesome)
    @user.follow(@moof)
    beeps = []
    beeps << @moof.beeps
    beeps << @awesome.beeps
    expect(@user.feed).to eq beeps.flatten.reverse
  end
end

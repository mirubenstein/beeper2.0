require 'rails_helper'

describe Beep do
  before(:each) do
    DatabaseCleaner.clean
    @user = FactoryGirl.create(:user)
    @moof = FactoryGirl.create(:user, name: "moof", email: "moof@moof.com")
    @raven = FactoryGirl.create(:user, name: "raven", email: "raven@raven.com")
    @beep = FactoryGirl.create(:beep, user_id: @user.id)
  end

  it { should belong_to :user }
  it { should validate_presence_of :beep }

  it "returns the user it's associated with" do
    expect(@beep.user).to eq @user
  end

  describe "#name_checker" do
    it "creates new tags for each user in a beep" do
      expect(@beep.users).to eq [@moof, @raven]
    end
  end

  # describe ".beepers_beeps_followed_by" do
  #   it "agrigates beeps from beepers a user follows" do
      
  #     expect(Beep.beepers_beeps_followed_by(@moof)).to eq [@user]
  #   end
  # end

end

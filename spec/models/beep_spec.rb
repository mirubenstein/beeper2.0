require 'rails_helper'

describe Beep do
  it { should belong_to :user }
  it { should validate_presence_of :beep }

  it "returns the user it's associated with" do
    DatabaseCleaner.clean
    user = FactoryGirl.create(:user)
    beep = FactoryGirl.create(:beep, user_id: user.id)
    expect(beep.user).to eq user
  end
end

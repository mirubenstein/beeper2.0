require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do

  before(:each) do
    DatabaseCleaner.clean
    @user = FactoryGirl.create(:user)
  end

  describe "signup_confirmation" do
    let(:mail) { UserMailer.signup_confirmation(@user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to the Clone")
      expect(mail.to).to eq(["blnkt@blnkt.com"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hello, you may already be a winner!  But if you're not, you can still be a member of Twitter-clone")
    end
  end

end

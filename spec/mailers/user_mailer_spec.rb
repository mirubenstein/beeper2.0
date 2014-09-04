require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do

  before(:each) do
    DatabaseCleaner.clean
    @user = FactoryGirl.create(:user)
    @moof = FactoryGirl.create(:user, name: "moof", email: "moof@moof.com")
    @beep = FactoryGirl.create(:beep, user_id: @user.id)
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

  describe "tag_notification" do
    let(:mail) { UserMailer.tag_notification(@beep.users.first, @beep) }

    it "renders the headers" do
      expect(mail.subject).to eq("You were mentioned in #{@beep.user.name}'s Beep")
      expect(mail.to).to eq([@beep.users.first.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Checkout")
    end
  end

end

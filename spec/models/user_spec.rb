require 'spec_helper'

describe User do
  subject { FactoryGirl.build(:user) }
  
  describe ".create_with_omniauth!" do
    let(:auth) do
      {
        "info" => {
          "name"  => "John Doe",
          "email" => "john.doe@example.com",
          "image" => "http://example.com/images/avatar.png"
        }
      }
    end
    subject { User.create_with_omniauth!(auth) }
    
    it "creates a new user with given name" do
      subject.name.should == auth["info"]["name"]
    end
    
    it "creates a new user with given email" do
      subject.email.should == auth["info"]["email"]
    end
    
    it "creates a new user with given avatar's URL" do
      subject.avatar_url.should == auth["info"]["image"]
    end
  end
  
  User::ROLES.each_key do |role|
    describe "##{role}?" do
      context "when a user has role '#{role}'" do
        before(:each) { subject.role = User::ROLES[role] }

        it "returns true" do
          subject.send("#{role}?").should be_true
        end
      end
      context "when a user does not have role 'admin'" do
        before(:each) { subject.role = nil }

        it "returns false" do
          subject.send("#{role}?").should be_false
        end
      end
    end
  end
  
  describe "#approved?" do
    context "when user is approved" do
      before(:each) { subject.update_attributes!(:approved_at => Time.now) }

      it "returns true" do
        subject.approved?.should be_true
      end
    end
    context "when user is not approved" do
      it "returns false" do
        subject.approved?.should be_false
      end
    end
  end
  
  describe "#approve!" do
    it "sets approved status" do
      subject.approve!
      subject.should be_approved
    end
  end
  
  describe "#unapprove!" do
    before(:each) { subject.update_attributes!(:approved_at => Time.now) }
    
    it "drops approved status" do
      subject.unapprove!
      subject.should_not be_approved
    end
  end
  
  describe "#guest?" do
    context "when a user has not been saved" do
      it "returns true" do
        subject.guest?.should be_true
      end
    end
    context "when a user has been saved" do
      before(:each) { subject.save! }
      
      it "returns false" do
        subject.guest?.should be_false
      end
    end
  end

  describe "#me?" do
    before(:each) { subject.save! }
    
    context "when given user is the same person" do
      it "returns true" do
        subject.me?(subject).should be_true
      end
    end
    context "when given user is not the same person" do
      it "returns false" do
        subject.me?(FactoryGirl.create(:user)).should be_false
      end
    end
  end
end

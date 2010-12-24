require 'spec_helper'

describe User do
  subject { Factory(:user) }
  
  it { should have_many(:authentications) }
  
  describe ".create_with_omniauth!" do
    let(:auth) do
      {
        "user_info" => {
          "name"  => "John Doe",
          "email" => "john.doe@example.com",
          "image" => "http://example.com/images/avatar.png"
        }
      }
    end
    subject { User.create_with_omniauth!(auth) }
    
    it "creates a new user with given name" do
      subject.name.should == auth["user_info"]["name"]
    end
    
    it "creates a new user with given email" do
      subject.email.should == auth["user_info"]["email"]
    end
    
    it "creates a new user with given avatar's URL" do
      subject.avatar_url.should == auth["user_info"]["image"]
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
    it "should set approved status" do
      subject.approve!
      subject.should be_approved
    end
  end
  
  describe "#unapprove!" do
    before(:each) { subject.update_attributes!(:approved_at => Time.now) }
    
    it "should drop approved status" do
      subject.unapprove!
      subject.should_not be_approved
    end
  end
end

require 'spec_helper'

describe Authentication do
  subject { FactoryGirl.build(:authentication) }
  
  it "is valid with valid attributes" do
    subject.should be_valid
  end
  
  it "is not valid without user" do
    subject.user = nil
    subject.should_not be_valid
  end

  it "is not valid without uid" do
    subject.uid = nil
    subject.should_not be_valid
  end
  
  it "is not valid without provider" do
    subject.provider = nil
    subject.should_not be_valid
  end

  it "is not valid without uniq uid scoped to provider" do
    other_authentication = FactoryGirl.create(:authentication, :uid => subject.uid, :provider => subject.provider)
    subject.should_not be_valid
  end
  
  describe ".create_with_omniauth" do
    it "creates a new authentication based on given params"
  end

  describe "#provider_name" do
    it "returns titleized provider name" do
      subject.provider_name.should == Authentication::PROVIDERS[subject.provider]
    end
  end
end

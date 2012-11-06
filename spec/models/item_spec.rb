require 'spec_helper'

describe Item do
  subject { FactoryGirl.build(:item) }
  
  it "is valid with valid attributes" do
    subject.should be_valid
  end
  
  it "is not valid without user" do
    subject.user = nil
    subject.should_not be_valid
  end

  it "is not valid without title" do
    subject.title = nil
    subject.should_not be_valid
  end

  it "is not valid without markdown" do
    subject.markdown = nil
    subject.should_not be_valid
  end
  
  context "before save" do
    before(:each) { subject.save! }
    
    it "convert markdown to HTML" do
      subject.html.should include("<strong>")
    end
    
    it "assigns html" do
      subject.html.should_not be_blank
    end
  end
  
  describe "#author?" do
    context "when given user is author of item" do
      it "returns true" do
        subject.author?(subject.user).should be_true
      end
    end
    context "when given user is not author of item" do
      it "returns false" do
        subject.author?(FactoryGirl.create(:user)).should be_false
      end
    end
  end

  describe "#author_name" do
    context "when item has author" do
      it "returns user's name" do
        subject.author_name.should == subject.user.name
      end
    end
    context "when item does not have author" do
      it "returns emtry string" do
        subject.user = nil
        subject.author_name.should == ""
      end
    end
  end
end

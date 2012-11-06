require 'spec_helper'

describe Comment do
  subject { FactoryGirl.build(:comment) }
  
  it "is valid with valid attributes" do
    subject.should be_valid
  end
  
  it "is not valid without user" do
    subject.user = nil
    subject.should_not be_valid
  end

  it "is not valid without item" do
    subject.item = nil
    subject.should_not be_valid
  end

  it "is not valid without markdown" do
    subject.markdown = nil
    subject.should_not be_valid
  end
  
  context "before save" do
    before { subject.save! }
    
    it "convert markdown to HTML" do
      subject.html.should include("<strong>")
    end
    
    it "assigns html" do
      subject.html.should_not be_blank
    end
  end
end

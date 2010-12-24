require 'spec_helper'

describe Authentication do
  subject { Factory(:authentication) }
  
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:provider) }
  it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
  
  describe ".create_with_omniauth" do
    it "creates a new authentication based on given params"
  end

  describe "#provider_name" do
    it "returns titleized provider name" do
      subject.provider_name.should == subject.provider.titleize
    end
  end
end

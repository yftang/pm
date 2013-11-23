require 'spec_helper'

describe Workship do
  let(:user)           { FactoryGirl.create(:user) }
  let(:project)        { FactoryGirl.create(:project) }
  let(:workship) { user.workships.build(project_id: project.id) }
  
  subject { workship }
  
  it { should be_valid }
  
  describe "workship methods" do
    it { should respond_to(:user) }
    it { should respond_to(:project) }
    its(:user) { should eq user }
    its(:project) { should eq project}
  end
  
  describe "when user id is not present" do
    before { workship.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when project id is not present" do
    before { workship.project_id = nil }
    it { should_not be_valid }
  end
end

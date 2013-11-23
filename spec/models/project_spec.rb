require 'spec_helper'

describe Project do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @project = Project.new(acc: "BC13132", start_date: Time.now.to_date, dead_line: 7.days.from_now.to_date)
  end
  
  subject { @project }
  
  it { should respond_to(:acc) }
  it { should respond_to(:start_date) }
  it { should respond_to(:dead_line) }
  
  it { should be_valid }
  
  describe "when acc is not present" do
    before { @project.acc = nil }
    it { should_not be_valid }
  end
end

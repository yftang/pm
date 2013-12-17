require 'spec_helper'

describe Project do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @project = Project.new(acc: "BC13132",
                           start_date: Time.now.to_date,
                           dead_line: 7.days.from_now.to_date,
                           status: "running")
  end

  subject { @project }

  it { should respond_to(:acc) }
  it { should respond_to(:start_date) }
  it { should respond_to(:dead_line) }
  it { should respond_to(:assigner) }
  it { should respond_to(:species) }
  it { should respond_to(:status) }

  it { should be_valid }

  describe "when acc is not present" do
    before { @project.acc = nil }
    it { should_not be_valid }
  end

  describe "with valie status" do
    it "should be valid" do
      valid_status = %w(running complete)

      valid_status.each do |s|
        @project.status = s
        expect(@project).to be_valid
      end
    end
  end

  describe "with invalid status" do
    it "should not be valid" do
      @project.status = 'invalid'
      expect(@project).not_to be_valid
    end
  end
end

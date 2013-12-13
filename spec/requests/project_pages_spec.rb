require 'spec_helper'

describe "ProjectPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "project creation" do
    before { visit root_path }

    describe "with invalid information" do
      it "should not create a project" do
        expect { click_button "Create" }.not_to change(Project, :count)
      end

      describe "error messages" do
        before { click_button "Create" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in 'project_acc',        with: 'Project_9'
        fill_in 'project_start_date', with: Time.now.to_date
        fill_in 'project_dead_line',  with: 1.day.from_now.to_date
        # choose 'running'
      end

      it "should create a project" do
        expect { click_button "Create" }.to change(Project, :count).by(1)
      end
    end
  end
end

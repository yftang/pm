require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Project Manager') }
    it { should have_title(full_title('Home')) }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('about') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1', text: 'Contact') }
    it { should have_title(full_title('Contact')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Home"
  end
end

require 'spec_helper'

	titleMessage ="Ruby on Rails Tutorial Sample App |"
	describe "Static Pages" do
	  subject {page}
	  describe "Home page" do
	  	before {visit root_path}
	      it { should have_content ('Sample App')}
	      tempStr = titleMessage.gsub(" |","")
	      it {should have_title(tempStr)}
	      it {should_not have_title("| Home")}
	  end

	  describe "Help page" do
	  	before {visit help_path}
	  	it {should have_content ('Help')}
		it {should have_title(titleMessage+" Help")}
	  end

	  describe "About page" do
	  	  before{visit about_path}
		  it {should have_content ('About Us')}
		  it {should have_title (titleMessage+" About Us")}
	  end
	  describe "Contact page" do
	  	  before{visit contact_path}
		  it {should have_content ('Contact')}
		  it {should have_title (titleMessage+" Contact")}
	end
end

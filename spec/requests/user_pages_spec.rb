require 'spec_helper'

describe "User Pages" do
	subject {page}
	describe "signup page" do
   		before {visit signup_path}
		  it {should have_content('Sign up')}
    	it {should have_title(full_title('Sign up'))}	
  end
	describe "Profile page" do
		let(:user) { FactoryGirl.create(:user)}
		before{visit user_path(user)}
		it{should have_content(user.name)}
		it{should have_title(user.name)}
	end
	describe "signup" do
		before {visit signup_path}
		let(:submit){"Create my account"}
		
    describe "with invalid information" do
			it "should not create a user" do
				expect{click_button submit}.not_to change(User, :count)
			end

      describe "after submission" do
        before {click_button submit}

        it {should have_title ('Sign up')}
        it {should have_content('error')}
      end
      describe "with empty name" do
        before {click_button submit}
        it {should have_content('* Name can\'t be blank')}
      end
		end
  		
    describe "with valid information" do
			before do
				fill_in "Name", 		with: "Tommy Nguyen"
				fill_in "Email", 		with: "tnguyen@hotmail.com"
				fill_in "Password", 	with: "tung1234"
				fill_in "Confirmation",	with: "tung1234"
		  end
			it "should create a user" do
				expect{click_button submit}.to change(User, :count).by(1)
			end
      describe "after save page" do
        before {click_button submit}
        let(:user) {User.find_by(email: 'tnguyen@hotmail.com')}

        it {should have_title(user.name)}
        it {should have_selector('div.alert.alert-sucess', text:'Welcome')}
      end
		end
  end
    
end

 





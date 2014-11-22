require "spec_helper"

feature "User changes profile" do
	scenario "with new name" do
		user = create(:user, password: "password")
      sign_in_with user.email, "password"
		visit edit_user_path user.id
		fill_in "user_fullname", with: "Thomas Jefferson"
		click_button "Update profile"

		visit root_path
		expect(page).to have_content "Thomas Jefferson"
	end

	scenario "with new avatar" do
		user = create(:user, password: "password")
      sign_in_with user.email, "password"
		visit edit_user_path user.id
		attach_file "user_avatar", "spec/support/data/test1.jpeg"
		click_button "Update profile"

		visit root_path
		expect(page).to have_xpath ".//img[contains(@src,'test1.jpeg')]"
	end
end
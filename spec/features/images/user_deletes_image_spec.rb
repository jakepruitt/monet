require "spec_helper"

feature "User deletes image" do
	scenario "from the details view" do
		sign_in_with_image

		click_link "Squirrel"
		click_link "Delete"

		expect(page).to have_no_content "Squirrel"
	end
end
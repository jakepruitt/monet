require "spec_helper"

feature "User edits image" do
	scenario "with a new title" do
		sign_in_with_image

		click_link "Squirrel"
		click_link "Edit"

		fill_in "image_title", with: "Chipmunk"

		click_button "Save"

		expect(page).to have_content "Chipmunk"
	end

	scenario "with a new description" do
		sign_in_with_image

		click_link "Squirrel"
		click_link "Edit"

		fill_in "image_description", with: "#ForestLyfe"

		click_button "Save"

		expect(page).to have_content "#ForestLyfe"
	end
end
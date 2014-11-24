require "spec_helper"

feature "User edits image" do
	before(:each) do
		sign_in_with_image

		click_link "Squirrel"
		click_link "Edit"
	end

	scenario "with a new title" do
		fill_in "image_title", with: "Chipmunk"

		click_button "Save"

		expect(page).to have_content "Chipmunk"
	end

	scenario "with a new description" do
		fill_in "image_description", with: "#ForestLyfe"

		click_button "Save"

		expect(page).to have_content "#ForestLyfe"
	end

	scenario "with a changed image" do
		find(:xpath, "//input[@data-filter='brightness']").set 57

		click_button "Save"

		expect(page).to have_xpath ".//img[contains(@src,'test1.jpeg')]"
	end

end
require "spec_helper"

feature "User creates image" do
	scenario "with all fields" do
		sign_in

		click_link "Upload"

		fill_in "image_title", with: "Thomas Jefferson"
		fill_in "image_description", with: "The Inconvenient Truth"
		attach_file "image_image", "spec/support/data/test1.jpeg"

		click_button "Upload image"

		expect(page).to have_content "Thomas Jefferson"
		expect(page).to have_content "The Inconvenient Truth"
      expect(page).to have_xpath ".//img[contains(@src,'test1.jpeg')]"
	end

	scenario "with no fields" do
		sign_in

		click_link "Upload"

		click_button "Upload image"

      expect(page).to have_xpath ".//img[contains(@src,'missing')]"
	end
end
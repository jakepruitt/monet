require "spec_helper"

feature "User views image" do
	scenario "on the home page" do
		sign_in_with_image

      expect(page).to have_content "Squirrel"
      expect(page).to have_xpath ".//img[contains(@src,'test1.jpeg')]"
	end

	scenario "on the detail page" do
		sign_in_with_image

		click_link "Squirrel"

		expect(page).to have_content "Squirrel"
		expect(page).to have_content "Description"
      expect(page).to have_xpath ".//img[contains(@src,'test1.jpeg')]"
	end
end
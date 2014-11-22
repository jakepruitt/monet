require "spec_helper"

feature "User adds image" do
	scenario "with a title and description" do
		user = create(:user, password: "password")
      sign_in_with user.email, "password"
		click_link "Upload"

		expect(page).to have_field "image_title"
		expect(page).to have_button "Upload image"
		image = create(:image, title: "Squirrel", description: "Another day in the forest")
		fill_in "image_title", with: image.title
		fill_in "image_description", with: image.description
		# attach_file "image_image", "spec/support/data/test1.jpeg"
		# expect(page).to have_content "Squirrel"
		# expect(page).to have_content "Another day in the forest"

		click_button "Upload image"

		# puts page.body

		expect(page).to have_content "Squirrel"
		expect(page).to have_content "Another day in the forest"
		expect(page).to have_xpath ".//img[contains(@src,'test1.jpeg')]"
	end
end
# require "spec_helper"

# feature "User deletes image" do
# 	scenario "from the details view" do
# 		user = create(:user, password: "password")
# 		image = create(:image, user: user)
# 		user.images << image
#       sign_in_with user.email, "password"

#       puts page.body

# 		click_link "Upload"

# 		expect(page).to have_field "image_title"
# 		expect(page).to have_button "Upload image"
# 		fill_in "image_title", with: image.title
# 		fill_in "image_description", with: image.description
# 		attach_file "image_image", "spec/support/data/test1.jpeg"
# 		# expect(page).to have_content "Squirrel"
# 		# expect(page).to have_content "Another day in the forest"

# 		click_button "Upload image"

# 		# puts page.body
# 		# save_and_open_page

# 		expect(page).to have_content "Squirrel"
# 		# expect(page).to have_content "Another day in the forest"
# 		# expect(page).to have_xpath ".//img[contains(@src,'test1.jpeg')]"
# 	end
# end
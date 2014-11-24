module Features
	module ImageHelpers
		def sign_in_with_image
			user = create(:user, password: "password")
			image = create(:image, user: user)
			user.images << image
			sign_in_with user.email, "password"
		end
	end
end
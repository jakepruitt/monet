FactoryGirl.define do
	sequence :email do |n|
		"user#{n}@example.com"
	end

	factory :user do
		email
		password "password"
	end

	factory :image do
		user
		title "Squirrel"
		description "Description"
		image Rack::Test::UploadedFile.new(Rails.root + "spec/support/data/test1.jpeg", "image/jpg")
	end
end

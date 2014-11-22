FactoryGirl.define do
	factory :image do
		association :user_id, factory: :user
		title "Title"
		description "Description"
		image Rack::Test::UploadedFile.new(Rails.root + "spec/support/data/test1.jpeg", "image/jpg")
	end

	sequence :email do |n|
		"user#{n}@example.com"
	end

	factory :user do
		email
		password "password"
	end
end

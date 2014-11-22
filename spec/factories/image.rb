FactoryGirl.define do
  factory :image do
    title "Title"
    description "Description"
    image Rack::Test::UploadedFile.new(Rails.root + "spec/support/data/test1.jpeg", "image/jpg")
  end
end
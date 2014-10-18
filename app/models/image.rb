class Image < ActiveRecord::Base

  # Relationship between users and images
  belongs_to :user

  # Validate the attached image is image/jpg, image/png, etc
  validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  # This method associates the attribute ":image" with a file attachment
  has_attached_file :image, styles: {
    original: '1024x768>',
    square: '200x200#'
  }
end

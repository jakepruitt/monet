class User < ActiveRecord::Base
  include Clearance::User

  has_many :images

  # Validate the attached image is image/jpg, image/png, etc
  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  # This method associates the attribute ":image" with a file attachment
  has_attached_file :avatar, :default_url => "/media/default_profile.jpg",
  styles: {
    original: '305x305>',
  }
end

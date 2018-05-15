class Guest < ApplicationRecord
  belongs_to :word
  has_attached_file :image,
    styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    },
    s3_server_side_encryption: 'AES256'

  validates_attachment_content_type :image, content_type: %w[image/jpg image/jpeg image/png]
end

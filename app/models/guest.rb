class Guest < ApplicationRecord
  belongs_to :word
  has_attached_file :image,
    styles: {
      thumb: '120x120#',
      normal: '600x600#'
    },
    s3_server_side_encryption: 'AES256'

  validates_attachment_content_type :image, content_type: %w[image/jpg image/jpeg image/png]
end

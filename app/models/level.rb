class Level < ApplicationRecord
  has_many :user_levels
  has_many :users, through: :user_levels
  has_many :words

  has_attached_file :image,
    styles: {
      thumb: '120x120#',
      normal: '600x600#'
    },
    s3_server_side_encryption: 'AES256'

  validates_attachment_content_type :image, content_type: %w[image/jpg image/jpeg image/png]
  validates :order, presence: true

  def user_level_for(user)
    user_levels.find_by(user_id: user.id)
  end
end

class User < ApplicationRecord
  devise :database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable

  acts_as_token_authenticatable

  has_many :user_levels
  has_many :levels, through: :user_levels

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
end

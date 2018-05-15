class User < ApplicationRecord
  devise :database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable

  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
end

class UserLevel < ApplicationRecord
  belongs_to :user
  belongs_to :level
end

class Consultant < ApplicationRecord
  belongs_to :fp_user, class_name: "User"
  belongs_to :user, required: false
  belongs_to :reserve
  validates :fp_user_id, presence: true
  validates :reserve_id, presence: true
end

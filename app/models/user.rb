class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_many :fp_consultants, class_name:  "Consultant",
                                foreign_key: "fp_user_id",
                                dependent:   :destroy
  has_many :consultant
  has_many :fp_reserves, through: :fp_consultants,  source: :reserve
  has_many :reserve, through: :consultant
  accepts_nested_attributes_for :fp_consultants, allow_destroy: true
  #has_many :following, through: :active_relationships,  source: :followed
  #has_many :followers, through: :passive_relationships, source: :follower
end

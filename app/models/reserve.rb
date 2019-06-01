class Reserve < ApplicationRecord
  has_many :consultants, dependent: :destroy
  #has_many :users, :through => :consultants
  has_many :fp_users, through: :consultants,  source: :fp_user
  has_many :users, through: :consultants
end

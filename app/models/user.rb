class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: :true
  validates :email, uniqueness: :true

  has_many :categories
  has_many :spend_records
  has_many :incoming_records

end

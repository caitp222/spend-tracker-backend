class CategoryRecord < ApplicationRecord
  validates :name, :color_hex, :type, presence: :true

  belongs_to :user
  has_many :spend_records
  has_many :incoming_records

end

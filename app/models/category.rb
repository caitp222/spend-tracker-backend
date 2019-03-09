class Category < ApplicationRecord
  validates :name, :color_hex, :category_type, presence: :true
  validates :category_type, inclusion: { in: ["incoming", "spend"] }

  belongs_to :user
  has_many :money_records

end

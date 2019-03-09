class SpendRecord < ApplicationRecord
  validates :date, :amount, :description, presence: :true

  belongs_to :user
  belongs_to :category

end

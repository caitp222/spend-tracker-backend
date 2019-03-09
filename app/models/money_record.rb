class MoneyRecord < ApplicationRecord
  validates :date, :amount, :description, :record_type, presence: :true
  validates :record_type, inclusion: { in: ["spend", "incoming"] }

  belongs_to :user
  belongs_to :category

end

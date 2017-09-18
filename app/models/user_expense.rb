class UserExpense < ApplicationRecord
  validates :user_id, :expense_id, :expense_amount, presence: true
  belongs_to :expense
  belongs_to :user
end

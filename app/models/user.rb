class User < ApplicationRecord
  before_save :downcase_email
  before_create :generate_access_token

  has_many :user_trips
  has_many :trips, through: :user_trips
  has_many :user_expenses
  has_many :debts, through: :user_expenses, source: :expense
  has_many :loans, foreign_key: :payer_id, class_name: :Expense

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  has_secure_password
end

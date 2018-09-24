class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :height, numericality:
    { allow_nil: true, greater_than_or_equal_to: HEIGHT_MINIMUM = 50,
      less_than_or_equal_to: HEIGHT_MAXIMUM = 257 }
  enum gender: { not_known: 0, male: 1, female: 2, not_applicable: 9 }
end

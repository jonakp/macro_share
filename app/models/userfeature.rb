class Userfeature < ApplicationRecord
  validates :user_id, presence: true
  validates :gender, presence: true
  validates :height, presence: true, numericality:
    { greater_than_or_equal_to: HEIGHT_MINIMUM = 50,
      less_than_or_equal_to: HEIGHT_MAXIMUM = 257 }
  validates :weight, presence: true, numericality:
    { greater_than_or_equal_to: WEIGHT_MINIMUM = 3,
      less_than_or_equal_to: HEIGHT_MAXIMUM = 200}
  validates :age, presence: true, numericality:
    { greater_than_or_equal_to: AGE_MINIMUM = 0,
      less_than_or_equal_to: AGE_MAXIMUM = 122}
  validates :activity, presence: true
  validates :purpose, presence: true
  enum gender: { not_known: 0, male: 1, female: 2, not_applicable: 9 }
  enum activity: %i[high middle low]
  enum purpose: %i[increase maintain loss]
end

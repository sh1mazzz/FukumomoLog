class SugarGlider < ApplicationRecord
  belongs_to :user
  has_many :daily_records, dependent: :destroy

  enum :gender, { male: 0, female: 1 }

  validates :name, presence: true
  validates :birthday, presence: true
  validates :weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999.9 }
end

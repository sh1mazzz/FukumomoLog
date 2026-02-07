class SugarGlider < ApplicationRecord
  belongs_to :user
  has_many :daily_records, dependent: :destroy

  enum :gender, { male: 0, female: 1 }
end

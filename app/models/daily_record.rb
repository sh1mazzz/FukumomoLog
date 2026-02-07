class DailyRecord < ApplicationRecord
  belongs_to :sugar_glider

  enum :food_amount, { normal: 0, much: 1, little: 2 }, prefix: true
  enum :snack_amount, { normal: 0, much: 1, little: 2 }, prefix: true
  enum :water_amount, { normal: 0, much: 1, little: 2 }, prefix: true
  enum :pee_amount, { normal: 0, much: 1, little: 2 }, prefix: true
  enum :pee_color, { normal: 0, light: 1, dark: 2 }, prefix: true
  enum :poop_amount, { normal: 0, much: 1, little: 2 }, prefix: true
  enum :poop_shape, { normal: 0, soft: 1, hard: 2 }, prefix: true

  validates :record_date, uniqueness: { scope: :sugar_glider_id }
  validates :cage_temperature, numericality: { greater_than_or_equal_to: -50, less_than_or_equal_to: 50 }
  validates :activity_hours, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }
  validate :activity_hours_half_step

  private

  # 活動時間が0.5刻みで入力されているか
  def activity_hours_half_step
    return if activity_hours.nil?
    return if ((activity_hours * 2) % 1).zero?

    errors.add(:activity_hours, "は0.5刻みで入力してください")
  end
end

class DailyRecord < ApplicationRecord
  belongs_to :sugar_glider

  enum :food_amount, { normal: 0, much: 1, little: 2 }
  enum :snack_amount, { normal: 0, much: 1, little: 2 }
  enum :water_amount, { normal: 0, much: 1, little: 2 }
  enum :pee_amount, { normal: 0, much: 1, little: 2 }
  enum :pee_color, { normal: 0, light: 1, dark: 2 }
  enum :poop_amount, { normal: 0, much: 1, little: 2 }
  enum :poop_shape, { normal: 0, soft: 1, hard: 2 }

  attribute :food_amount, :integer, default: 0
  attribute :snack_amount, :integer, default: 0
  attribute :water_amount, :integer, default: 0
  attribute :pee_amount, :integer, default: 0
  attribute :pee_color, :integer, default: 0
  attribute :poop_amount, :integer, default: 0
  attribute :poop_shape, :integer, default: 0
  attribute :night_crying, :boolean, default: false
  attribute :hair_loss, :boolean, default: false
  attribute :ear_dryness, :boolean, default: false
  attribute :self_injury, :boolean, default: false

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

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :sugar_glider, dependent: :destroy

  validates :name, presence: true
end

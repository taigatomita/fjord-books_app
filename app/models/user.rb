# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :icon
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :icon, content_type: %i[png jpg gif], size: { less_than_or_equal_to: 10.megabytes }, dimension: { width: { max: 2000 }, height: { max: 2000 } }
end

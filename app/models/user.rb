# frozen_string_literal: true

class User < ApplicationRecord
  has_many :active_follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :passive_follows, class_name: 'Follow', foreign_key: 'followee_id', dependent: :destroy, inverse_of: :followee

  has_many :followings, through: :active_follows, source: :followee
  has_many :followers, through: :passive_follows, source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def follow(other_user)
    active_follows.find_or_create_by(followee_id: other_user.id)
  end

  def unfollow(other_user)
    friendship = active_follows.find_by(followee_id: other_user.id)
    friendship&.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end

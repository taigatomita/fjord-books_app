# frozen_string_literal: true

class User < ApplicationRecord
  has_many :follows, dependent: :destroy
  has_many :followings, through: :follows, source: :follow

  has_many :reverse_of_follows, class_name: 'Follow', foreign_key: 'follow_id', dependent: :destroy, inverse_of: :follow
  has_many :followers, through: :reverse_of_follows, source: :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def follow(other_user)
    return if self == other_user

    follows.find_or_create_by(follow_id: other_user.id)
  end

  def unfollow(other_user)
    friendship = follows.find_by(follow_id: other_user.id)
    friendship&.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end

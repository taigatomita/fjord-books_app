# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def contributor_name
    user.name.presence || user.email
  end
end

# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  validates :content, presence: true, length: { minimum: 1, maximum: 300 }

  default_scope { order(created_at: :desc) }

  def creator
    User.find_by(id: user_id)
  end

  def liked?(user)
    likes.find_by(user_id: user.id)
  end
end

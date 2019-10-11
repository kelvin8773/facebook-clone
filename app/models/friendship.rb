# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :friend, class_name: 'User', foreign_key: :friend_id

  validates :user, uniqueness: { scope: :friend }
  validate :user_and_friend_are_different

  def user_and_friend_are_different
    errors.add(:friend_id, "can't be same as user") if user_id == friend_id
  end
end

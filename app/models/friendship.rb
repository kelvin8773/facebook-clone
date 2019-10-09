# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user, foreign_key: :friend_id
  belongs_to :friend, class_name: 'User'


  # scope :friendship, -> {where(self.confirmed: true)}

  after_create do |p|
    Friendship.create!(user_id: p.friend_id, friend_id: p.user_id) unless Friendship.find_by(user_id: p.friend_id, friend_id: p.user_id)
  end

  after_update do |p|
    reciprocal = Friendship.find_by(user_id: p.friend_id, friend_id: p.user_id)
    reciprocal.confirmed = p.confirmed unless reciprocal.nil?
  end

  after_destroy do |p|
    reciprocal = Friendship.find_by(user_id: p.friend_id, friend_id: p.user_id)
    reciprocal.destroy unless reciprocal.nil?
  end

  # validates :user, uniqueness: { scope: :friend }
  validate :user_and_friend_are_different

  def user_and_friend_are_different
    errors.add(:friend_id, "can't be same as user") if user_id == friend_id
  end
end

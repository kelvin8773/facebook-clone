# frozen_string_literal: true

class User < ApplicationRecord
  include Gravtastic
  gravtastic
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :friends, -> { where(friendships: {confirmed: true}) }, :through => :friendships


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 5 }

  def first_name
    name.split(' ').first
  end

  def last_name
    name.split(' ').last
  end

  # Users who are yet to confirm ur friend request
  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  def cancel_friend_request(user)
    friendship = friendships.find { |f| f.friend_id == user.id }
    friendship.destroy
  end

  # Users who have requested to be friends
  def friend_requests
    Friendship.where('friend_id =?', id).map {|friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend(user)
    friendship = Friendship.find_by(user_id: user.id, friend_id: id)
    friendship.confirmed = true
    friendship.save
  end

  
  def friend?(user)
    friends.include?(user)
  end
end

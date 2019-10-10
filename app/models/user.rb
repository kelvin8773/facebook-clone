# frozen_string_literal: true

class User < ApplicationRecord
  include Gravtastic
  gravtastic
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships, dependent: :destroy
  # has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  # has_many :friends, through: :friendships, source:  :user
  # has_many :friends, -> { friendship }, through: :friendships, source: :user
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

  # def friends
  #   friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
  #   friends_array += inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
  #   friends_array.compact
  # end

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
    friendships.map { |friendship| friendship.user unless friendship.confirmed && 
      friendship.friend_id != id }.compact
  end

  def confirm_friend(user)
    friendship = Friendship.find_by(user_id: user.id, friend_id: id)
    friendship.confirmed = true
    friendship.save
  end

  # def user_object

  # end
  def friend?(user)
    friendships.map {|friendship| friendship.user if friendship.confirmed }.include?(user)
  end
end

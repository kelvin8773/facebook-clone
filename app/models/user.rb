# frozen_string_literal: true

class User < ApplicationRecord
  include Gravtastic
  gravtastic
  has_many :posts, dependent: :destroy
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

end
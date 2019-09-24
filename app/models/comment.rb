class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable, dependent: :destroy


  def liked?(user)
    likes.find_by(user_id: user.id)
  end

  
end

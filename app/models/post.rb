class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { minimum: 10, maximum: 300 }
  
  default_scope { order(created_at: :desc) }

  def creator
    User.find_by(id: user_id)
  end

end

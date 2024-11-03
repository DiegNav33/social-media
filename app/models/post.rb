class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many_attached :images

  validates :content, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end

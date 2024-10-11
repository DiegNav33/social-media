class Follow < ApplicationRecord

  belongs_to :follower, class_name: 'User'   # L'utilisateur qui suit
  belongs_to :followed, class_name: 'User'   # L'utilisateur qui est suivi

  validates :follower_id, uniqueness: { scope: :followed_id }

  validate :cannot_follow_self

  private

  def cannot_follow_self
    errors.add(:follower_id, "can't follow yourself") if follower_id == followed_id
  end
end

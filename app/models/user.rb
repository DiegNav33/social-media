class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :profile_picture

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :followed

  has_many :follower_relationships, foreign_key: :followed_id, class_name: 'Follow', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower


  validates :link, format: { with: /\A(http|https):\/\/[\S]+\z/, message: "must be a valid URL" }, allow_blank: true


  # validates :pseudo, presence: true

end

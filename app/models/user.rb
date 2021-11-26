class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :reptiles, dependent: :destroy
has_many :reptile_comments, dependent: :destroy
has_many :favorites, dependent: :destroy
attachment :profile_image

#フォロー機能のルーティング設定
has_many :relationships, foreign_key: :following_id
#フォローしている人を持ってくる
has_many :followings, through: :relationships, source: :follower
has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
#フォローされている人を持ってくる
has_many :followers, through: :reverse_of_relationships, source: :following

 def already_favorited?(reptile)
      self.favorites.exists?(favorite_id: favorites.id)
 end

 def already_following?(user)
      self.followings.exists?(id: user.id)
 end

end

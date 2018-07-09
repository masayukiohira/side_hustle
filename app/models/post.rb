class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :reports, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :favorites, dependent: :destroy

	attachment :image

	validates :user, presence: true
	validates :title, presence: true, length: { in: 1..20 }
	validates :body, presence: true, length: { in: 1..140 }
	validates :category, presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

	def commented_by?(user)
		comments.where(user_id: user.id).exists?
	end

	def reported_by?(user)
		reports.where(user_id: user.id).exists?
	end

	default_scope -> { order(created_at: :desc) }
end

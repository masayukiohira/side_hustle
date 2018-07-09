class Favorite < ApplicationRecord
	belongs_to :post
	belongs_to :user

	validates :user, presence: true
	validates :user_id, uniqueness: { scope: :post_id } #同じ投稿を複数回ブックマークはできないため、scope付きのuniqueness制約をかける
	validates :post, presence: true
end

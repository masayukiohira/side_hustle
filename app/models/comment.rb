class Comment < ApplicationRecord
	belongs_to :post, :counter_cache => true
	belongs_to :user

	validates :user, presence: true
	validates :user_id, uniqueness: { scope: :post_id }
	validates :post, presence: true
	validates :body, length: { in:1..140 }
end

class Report < ApplicationRecord
	belongs_to :post
	belongs_to :user

	validates :user, presence: true
	validates :user_id, uniqueness: { scope: :post_id }
	validates :post, presence: true

end

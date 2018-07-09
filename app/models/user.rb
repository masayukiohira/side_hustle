class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attribute :title, :text, :default => 'ーーーーー' #include?を使うため、nilを弾いた

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def active_for_authentication?
		super && !unsubscribe?
	end

	def inactive_message
		!unsubscribe? ? super : :reregistration

	end

	has_many :follows, foreign_key: :follower_id, dependent: :destroy
	has_many :inverse_followers, through: :follows
	has_many :inverse_follows, foreign_key: :inverse_follower_id, class_name: Follow, dependent: :destroy
	has_many :followers, through: :inverse_follows
	has_many :posts, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :reports, dependent: :destroy
	has_many :from_messages, class_name: Message, foreign_key: :from_id, dependent: :destroy
	has_many :to_messages, class_name: Message, foreign_key: :to_id, dependent: :destroy
	has_many :sent_messages, through: :from_messages, source: :from
	has_many :received_messages, through: :to_messages, source: :to

	attachment :image

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: false, if: :user_signed_in?
    validates :password_confirmation, presence: true, if: :password
	validates :introduction, length: { maximum:140 }

	validate :password_complexity

  def password_complexity
    if password.present? and not password.match(/([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/)
      	errors.add :password, "は半角英数字にしてください"
    end
  end

	def followed_by?(user)
		inverse_follows.where(follower_id: user.id).exists?
	end

	def send_message(other_user, room_id, content)
		from_messages.create!(to_id: other_user.id, room_id: room_id, content: content)
	end
end
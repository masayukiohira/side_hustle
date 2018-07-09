class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
    validates :password, presence: false, if: :admin_signed_in?
    validates :password_confirmation, presence: true, if: :password

    validate :password_complexity

  def password_complexity
    if password.present? and not password.match(/([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/)
      	errors.add :password, "は半角英数字にしてください"
    end
  end
end

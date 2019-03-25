class User < ApplicationRecord
  validates :user_name, presence: true, length: { minimum: 4, maximum: 12 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end

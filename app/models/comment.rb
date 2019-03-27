class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 2, maximum: 80 }

  belongs_to :post
  belongs_to :user
end

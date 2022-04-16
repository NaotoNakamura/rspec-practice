class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: {maximum: 140}
  validates :user_id, presence: true
end

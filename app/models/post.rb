class Post < ApplicationRecord
  belongs_to :user
  validates :author, presence:true
  validates :title, presence: true
  validates :body, presence: true
  validates :chatkey, presence: true
end

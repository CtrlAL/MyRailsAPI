class Chat < ApplicationRecord
  has_many :chat_messages
  has_and_belongs_to_many :users
  validates :chatkey, presence: true
end

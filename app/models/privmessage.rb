class Privmessage < ApplicationRecord
  belongs_to :user
  belongs_to :pchat
  validates :mestext ,presence: true
end

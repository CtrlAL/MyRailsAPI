class Pchat < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :privmessages
  validates :adress_user, presence:true
  validates :chatid, presence:true
end

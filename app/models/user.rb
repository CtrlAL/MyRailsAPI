class User < ApplicationRecord
  has_and_belongs_to_many :chats
  has_many :posts
  has_many :chat_messages
  has_many :privmessages
  has_and_belongs_to_many :pchat

  validates :name, presence: true
  validates :latetude, presence: true
  validates :longitude, presence: true
  before_create -> {self.token = generate_token}
  before_create -> {self.uuid = generate_uuid}

  private

  def generate_uuid
    loop do
      uuid = SecureRandom.uuid
      return uuid unless User.exists?({uuid: uuid})
    end
  end
  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless User.exists?({token: token})
    end
  end
end

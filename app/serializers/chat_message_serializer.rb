class ChatMessageSerializer < ActiveModel::Serializer
  attributes :text
  belongs_to :user
  belongs_to :chat
class UserSerializer < ActiveModel::Serializer
    attributes :name,:latetude,:longitude,:uuid,:token
end
class ChatSerializer < ActiveModel::Serializer
  attributes :chatkey,:title ,:users
end
end

class ChatMessageSerializer < ActiveModel::Serializer
  attributes :text , :createtd_at
  belongs_to :user
  belongs_to :chat
class UserSerializer < ActiveModel::Serializer
    attributes :name,:uuid
end
class ChatSerializer < ActiveModel::Serializer
  attributes :chatkey,:title
end
end

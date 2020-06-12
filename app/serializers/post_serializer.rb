class PostSerializer < ActiveModel::Serializer
  attributes :title, :body ,:author,:chatkey ,:created_at,:updated_at
  belongs_to :user

  class UserSerializer < ActiveModel::Serializer
    attributes :name ,:uuid
  end
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:latetude,:longitude,:uuid,:token,:radius
end

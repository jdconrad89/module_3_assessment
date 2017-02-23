class ItemsSerializer < ActiveModel::Serializer
  attributes :name, :description, :image_url
end

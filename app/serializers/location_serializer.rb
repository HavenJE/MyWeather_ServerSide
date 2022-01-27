class LocationSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user, :category

  belongs_to :user, optional: true 
end

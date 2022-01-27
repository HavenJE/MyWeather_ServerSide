class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email

  has_many :locations 
end

# The above data are the ones we are returning 
# you don't want to serilize your user password 
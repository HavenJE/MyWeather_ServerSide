class User < ApplicationRecord
    has_many :locations

    has_secure_password
    validates :username, :email, :password_digest, presence: true
end

# The has_secure method will give us 1. the .authenticate method which we going to utilise in our controller upon logging in 2. provides reader/writer for the salted (randomised) password 
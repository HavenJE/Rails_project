class User < ApplicationRecord
    has_many :exercises 
    has_many :categories, through: :exercises
    has_secure_password

    validates :username, :email, presence: true 
end



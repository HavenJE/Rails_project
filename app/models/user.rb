class User < ApplicationRecord
    has_many :exercises 
    has_many :categories, through: :exercises
end

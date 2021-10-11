class Category < ApplicationRecord
    has_many :exercises 
    has_many :users, through: :exercises 

    validates :name, uniqueness: true, presence: true 
end

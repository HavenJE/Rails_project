class Category < ApplicationRecord
    has_many :exercises, dependent: :delete_all     
    has_many :users, through: :exercises 

    validates :name, uniqueness: true, presence: true 
end

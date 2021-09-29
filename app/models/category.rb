class Category < ApplicationRecord
    has_many :exercises 
    has_many :users, through :exercises 
end

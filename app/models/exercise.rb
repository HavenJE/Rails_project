class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :users, through: :categories
end

# user in line 2 gives us => writer method def user=() and reader method def user 
# while users in line 4 gives us => the writer method only def users 
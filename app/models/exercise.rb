class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :category, dependent: :destroy 
  has_many :users, through: :categories

  validates :title, :description, presence: true 

  scope :alpha, -> { order(:title) }

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank? 
  end 

  accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }
  
end


# <% if @exercise.errors.any? %>
#   <div id="error_explanation">
#     <h2><%= pluralize(@exercise.errors.count, "error") %> prohibited this exercise from being saved:</h2>

#     <ul>
#       <% @exercise.errors.each do |error| %>
#         <li><%= error.full_message %></li>
#       <% end %>
#     </ul>
#   </div>
# <% end %>

# user in line 2 gives us => writer method def user=() and reader method def user 

# while users in line 4 gives us => the writer method only def users 

# The :category in line 14, will do a different method category_attributes in our html [category_attributes][name] that accepts a hash of attributes which then would create a new category 
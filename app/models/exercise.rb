class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true 
  has_many :users, through: :categories
end

# user in line 2 gives us => writer method def user=() and reader method def user 
# while users in line 4 gives us => the writer method only def users 

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
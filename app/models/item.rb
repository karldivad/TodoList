class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :todo_l
end

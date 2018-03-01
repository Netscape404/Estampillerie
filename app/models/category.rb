class Category < ApplicationRecord
  has_many :projects
  has_many :subcategories
end

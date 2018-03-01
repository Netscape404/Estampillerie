class Project < ApplicationRecord
  has_and_belongs_to_many   :tags
  belongs_to                :user
  belongs_to                :category
  belongs_to                :subcategory


  has_attached_file :thumbnail,
              styles: {medium: "600x400^"},
              default_url: '/images/:styles/missing.png'

  validates_attachment :thumbnail,
              content_type: {content_type: /image/, message: "Thumbnail must be an image"},
              size: {in: 0..3.megabytes, message: "Thumbnail be less than 3 megabytes in size"}


  enum difficulty: %i[beginner intermediate hard expert]
end

class Article < ApplicationRecord
  belongs_to :user


  has_attached_file :thumbnail,
              styles: {medium: "600x400^"},
              default_url: '/images/:styles/missing.png'

  validates_attachment :thumbnail,
              content_type: {content_type: /image/, message: "Thumbnail must be an image"},
              size: {in: 0..3.megabytes, message: "Thumbnail be less than 3 megabytes in size"}


  enum category: %i[media estampillerie new_project partnership miscellaneous]
end

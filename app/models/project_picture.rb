class ProjectPicture < ApplicationRecord
  belongs_to :project

  has_attached_file :picture,
              styles: {small:"150x150>", medium: "300x200>", large: '1920x1200^'},
              default_url: '/images/:styles/missing.png'

  validates_attachment :picture,
              content_type: {content_type: /image/, message: "Picture must be an image"},
              size: {in: 0..3.megabytes, message: "Picture be less than 3 megabytes in size"}

end

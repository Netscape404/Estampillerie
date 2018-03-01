class ProjectFile < ApplicationRecord
  belongs_to :project

  has_attached_file :file,
              styles: {medium: "600x400^", large: '1920x1200^'},
              default_url: '/images/:styles/missing.png'

  validates_attachment :file,
              content_type: {content_type: ["image/jpg", "image/jpeg", "image/png",
                        "image/svg", "image/gif", "application/force-download",
                        "application/xls", "application/xlsx", "application/doc",
                        "application/docx", "application/ppt", "application/pptx",
                        "application/zip"], message: "File must be an image"},
              size: {in: 0..9.megabytes, message: "File be less than 9 megabytes in size"}

end

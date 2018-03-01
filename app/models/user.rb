class User < ApplicationRecord
  has_and_belongs_to_many   :tags
  has_many                  :projects
  has_many                  :comments, dependent: :destroy
  has_many                  :articles
  has_many                  :tutorials

  attr_accessor :login
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable


  # Login with email or username
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: login.downcase).first
    else
      where(conditions.to_hash).first
    end
  end

   has_attached_file :avatar,
              styles: {medium: '320x320^', thumb:'180x180^'},
              default_url: '/images/:styles/missing.png'

  validates_attachment :avatar,
              content_type: {content_type: /image/, message: "Avatar must be an image"},
              size: {in: 0..2.megabytes, message: "Avatar must be less than 2 megabytes in size"}


  has_attached_file :cover_picture,
              styles: {cover: '1920x1200^'},
              default_url: '/images/:styles/missing.png'

  validates_attachment :cover_picture,
              content_type: {content_type: /image/, message: "Cover picture must be an image"},
              size: {in: 0..5.megabytes, message: "Cover picture be less than 5 megabytes in size"}



end

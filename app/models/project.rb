class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  mount_uploader :image, ImageUploader
end

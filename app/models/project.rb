class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true, uniqueness: true
end

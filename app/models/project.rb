class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  mount_uploader :image, ImageUploader

  # def set_status
  #   self.tasks.each_with_index do |task|
  #
  # end
end

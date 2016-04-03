class Photo < ActiveRecord::Base
  belongs_to :menu

  mount_uploader :image, ImageUploader
end

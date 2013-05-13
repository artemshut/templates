class Avatar < ActiveRecord::Base


  THUMB_IMAGE = "75x75"
  SMALL_IMAGE = "150x150"
  MEDIUM_IMAGE = "300x300"

  attr_accessible :avatar

  has_attached_file :avatar,
                    :styles => {thumb: THUMB_IMAGE,
                                small: SMALL_IMAGE,
                                medium: MEDIUM_IMAGE}
  belongs_to :post
end

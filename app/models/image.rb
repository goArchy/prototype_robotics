class Image < ActiveRecord::Base
  attr_accessible :attachment, :attachment_file_name, :gallery_id
  has_attached_file :attachment, :styles => { :large => "640x480>", :medium => "320x240>", :thumb => "100x100>" }

  belongs_to :gallery
end

class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :large => "640x480!", :slider => "480x360!", :medium => "320x240!", :thumb => "100x100!" }
end

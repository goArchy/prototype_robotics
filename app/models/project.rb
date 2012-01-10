class Project < ActiveRecord::Base
  has_many :steps
  accepts_nested_attributes_for :steps
  has_attached_file :image, :styles => { :large => "640x480!", :slider => "480x360!", :medium => "320x240!", :thumb => "100x100!" }
end

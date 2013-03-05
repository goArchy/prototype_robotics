class Step < ActiveRecord::Base
  attr_accessible :name, :description, :tutorial_id, :step_number, :image, :image_file_name
  belongs_to :tutorial
  belongs_to :project
  has_attached_file :image, :styles => { :large => "640x480>", :slider => "480x360>", :medium => "320x240>", :thumb => "100x100>" }
  has_many :galleries
end

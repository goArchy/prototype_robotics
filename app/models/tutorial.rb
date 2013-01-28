class Tutorial < ActiveRecord::Base

  has_many :steps
  has_many :galleries

  accepts_nested_attributes_for :steps

  has_attached_file :image, :styles => { :large => "640x480>", :slider => "640x480^", :cropped => "640x480#", :medium => "320x240>", :thumb => "100x100>" }

  include PgSearch
  multisearchable :against => [:name, :description]

  extend FriendlyId
  friendly_id :name, use: :slugged

end

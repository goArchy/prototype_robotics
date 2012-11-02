class Article < ActiveRecord::Base

  belongs_to :user
  has_many :galleries

  has_attached_file :image, :styles => { :large => "640x480>", :slider => "480x360>", :medium => "320x240>", :thumb => "100x100>" }

  include PgSearch
  multisearchable :against => [:name, :description]

  extend FriendlyId
  friendly_id :name, use: :slugged

end

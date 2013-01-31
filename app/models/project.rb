class Project < ActiveRecord::Base

  belongs_to :user
  has_many :steps
  has_many :galleries

  scope :published, where(:published => true)

  accepts_nested_attributes_for :steps

  has_attached_file :image, :styles => { :large => "640x480>", :medium => "320x240>", :thumb => "100x100>" }

  include PgSearch
  multisearchable :against => [:name, :description]

  extend FriendlyId
  friendly_id :name, use: :slugged

end

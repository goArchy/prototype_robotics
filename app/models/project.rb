class Project < ActiveRecord::Base
  attr_accessible :name, :description, :user_id, :image, :image_file_name, :slug

  belongs_to :user
  has_many :steps
  has_one :gallery

  scope :published, where(:published => true)
  scope :active, where(:deleted => false)
  scope :featured, where(:featured => true)

  accepts_nested_attributes_for :steps

  has_attached_file :image, :styles => { :large => "640x480>", :medium => "320x240>", :thumb => "100x100>" }

  include PgSearch
  multisearchable :against => [:name, :description]

  extend FriendlyId
  friendly_id :name, use: :slugged

  def active?
    published == true && deleted == false
  end

end

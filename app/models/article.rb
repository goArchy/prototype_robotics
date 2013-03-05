class Article < ActiveRecord::Base
  attr_accessible :name, :description, :user_id, :image, :image_file_name, :slug, :category

  belongs_to :user
  has_many :galleries

  scope :published, where(:published => true)

  has_attached_file :image, :styles => { :large => "640x480>", :medium => "320x240>", :thumb => "100x100>" }

  include PgSearch
  multisearchable :against => [:name, :description]

  extend FriendlyId
  friendly_id :name, use: :slugged

  def posted_at
    created_at.strftime("%m/%d/%Y")
  end

end

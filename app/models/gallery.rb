class Gallery < ActiveRecord::Base
  attr_accessible :name, :description, :project_id, :gallery_type, :article_id, :tutorial_id, :step_id

  belongs_to :article
  belongs_to :project
  belongs_to :tutorial
  belongs_to :step

  has_many :images
  accepts_nested_attributes_for :images
end

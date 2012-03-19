class Spree::Gallery < ActiveRecord::Base
  belongs_to :article
  belongs_to :project
  belongs_to :tutorial
  belongs_to :step

  has_many :images, :class_name => "Spree::Image"
end

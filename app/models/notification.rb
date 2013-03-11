class Notification < ActiveRecord::Base
  attr_accessible :message, :post_id, :project_id, :user_id
  belongs_to :project
  belongs_to :user

  scope :active, where(:read => false)
end

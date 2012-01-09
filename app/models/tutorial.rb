class Tutorial < ActiveRecord::Base
  has_many :steps
  accepts_nested_attributes_for :steps
end

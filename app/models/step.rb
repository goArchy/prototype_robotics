class Step < ActiveRecord::Base
  belongs_to :tutorial
  belongs_to :project
end

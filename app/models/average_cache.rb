class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Author"
  belongs_to :rateable, :polymorphic => true
end

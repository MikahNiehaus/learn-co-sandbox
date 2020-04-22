class Topic < ActiveRecord::Base
  has_many :posts
  #	has_many - Indicates a one-to-many connection with another model. This association indicates that each instance of the model has zero or more instances of another mode.
  belongs_to :user
  #belongs_to - A belongs_to association sets up a one-to-one connection with another model, such that each instance of the declaring model "belongs to" one instance of the other model.
end

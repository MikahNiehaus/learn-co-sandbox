class Post < ActiveRecord::Base
  belongs_to :topic
  #belongs_to - A belongs_to association sets up a one-to-one connection with another model, such that each instance of the declaring model "belongs to" one instance of the other model.
end

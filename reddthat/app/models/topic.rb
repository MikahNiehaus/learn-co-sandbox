class Topic < ActiveRecord::Base
  has_many :posts
  belongs_to :user
end

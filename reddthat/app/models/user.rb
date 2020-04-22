class User < ActiveRecord::Base
    has_secure_password
    #Adds methods to set and authenticate against a BCrypt password. This mechanism requires you to have a XXX_digest attribute. Where XXX is the attribute name of your desired password.
    has_many :topics
    #belongs_to - A belongs_to association sets up a one-to-one connection with another model, such that each instance of the declaring model "belongs to" one instance of the other model.
end

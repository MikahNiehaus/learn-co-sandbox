class User < ActiveRecord::Base
    has_secure_password
    #Adds methods to set and authenticate against a BCrypt password. This mechanism requires you to have a XXX_digest attribute. Where XXX is the attribute name of your desired password.
    has_many :topics
   
end

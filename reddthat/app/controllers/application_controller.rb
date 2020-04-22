#MVC (model veiw contr.) Pattern
require 'sinatra/flash' 
 #holds state
enable :sessions

class ApplicationController < Sinatra::Base
  
 #veiw to uses for this controler
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


   configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end
  
  
# get '/' do
#   .. show something ..
# end

# post '/' do
#   .. create something ..
# end

# put '/' do
#   .. replace something ..
# end

# patch '/' do
#   .. modify something ..
# end

# delete '/' do
#   .. annihilate something ..
# end
  
#   .. show something ..
  get "/" do
    #Use ERB substitution and scripting tags to modify the content and structure of HTML code
    erb :index
  end
#   .. show something ..
  get "/signup" do
     #Use ERB substitution and scripting tags to modify the content and structure of HTML code
    erb :signup
  end
  
#checks if it is a new user
 def new_username?(u)
    all = User.all
    all.each do |user|
      if user.username == u
       return false
       break
    end
  end
    return true
 end
 
 #   .. create something ..
  post "/signup" do
  if new_username?(params[:username])
    if params[:username] == "" || params[:password] == ""
      redirect to "/failure"
    else
      User.create(:username => params[:username], :password => params[:password])
      redirect to "/login"
    end
  else
   session[:error_message] = "Error: username has been used."
  end
  end

#   .. show something ..
  get "/login" do
     #Use ERB substitution and scripting tags to modify the content and structure of HTML code
    erb :login
  end
  
#   .. create something ..
  post "/login" do
     user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/topics"
    else
      redirect to "/failure"
    end
  end

#   .. show something ..
  get "/failure" do
     #Use ERB substitution and scripting tags to modify the content and structure of HTML code
    erb :failure
  end

#   .. show something ..
  get "/logout" do
       session.clear
       redirect to "/"
  end

#checks if logged in or/and current_user
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
  
end

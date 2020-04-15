require 'sinatra/flash' 
enable :sessions

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


   configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    erb :signup
  end
  

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
  post "/signup" do
  if new_username?(params[:username])
    if params[:username] == "" || params[:password] == ""
      redirect to "/failure"
    else
      User.create(:username => params[:username], :password => params[:password])
      redirect to "/login"
    end
  else
   # flash[:notice] = "Hooray, Flash is working!"
  end
  end


  get "/login" do
    erb :login
  end

  post "/login" do
     user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/topics"
    else
      redirect to "/failure"
    end
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
       session.clear
       redirect to "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
  
end

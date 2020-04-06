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

  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect to "/failure"
    else
      User.create(:username => params[:username], :password => params[:password])
      redirect to "/login"
    end
  end
  

  get '/account' do
    @user = User.find(session[:user_id])
 
    erb :account
  end


  get "/login" do
    erb :login
  end

  post "/login" do
     user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/owners/new"
    else
      redirect to "/failure"
    end
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    # binding.pry
  
   #might need to rederect
     
       session.clear
       redirect to "/"
       binding.pry
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
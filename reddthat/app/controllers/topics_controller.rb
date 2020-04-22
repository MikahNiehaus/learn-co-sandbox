require 'pry'
class TopicsController < ApplicationController

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
  get '/topics' do
    #if you do not queriry anything you will at least get status code
    #EX: 200 255 0.0165
   @topics = Topic.all
   erb :'/topics/index'
  end 

#   .. show something ..
  get '/topics/new' do
    @posts = Post.all
    erb :'/topics/new'
  end

# used in updating topic
#   .. modify something ..
   patch '/topics/:id' do
     if params[:topic][:text] != ""
       @topic = Topic.find(params[:id])
  if @topic.user_id == current_user.id
  
    if !params["topic"]["text"].empty?
         @topic.update(params["topic"])
      # @topic = (text: params["topic"]["text"])
    end
  
     @topic.save
      else
  # flash[:error] = "error."
end
   
  else
    # session[:error_message] = "Error: you need a new topic"
  end
   redirect to "topics/#{params[:id]}"
  end

# used to create new topic
#   .. create something ..
  post '/topics' do
    @topic = Topic.create(text: params[:topic][:text], user_id: params[:topic][:user_id])
    if !params["post"]["text"].empty?
      @topic.posts << Post.create(text: "[#{current_user.username}] " + params["post"]["text"], user_id: params[:post][:user_id])
    end
    
    @topic.save 
    redirect "topics/#{@topic.id}"
  end
# used to delete topic
  

# used to create new topic
#   .. show something ..
  get '/topics/:id' do
    @topic = Topic.find(params[:id])
    erb :'/topics/show'
  end
  
  #   .. annihilate something ..
delete '/topics/delete/:id' do
  # binding.pry
    @topic = Topic.find(params[:id])
   if @topic.user_id == current_user.id

   @topic.delete
   redirect to "/topics"
 else
    # session[:error_message] = "Error: you can only delete topics you make"
    redirect to "/topics/#{params[:id]}"
 end
 
  end
  
  
end

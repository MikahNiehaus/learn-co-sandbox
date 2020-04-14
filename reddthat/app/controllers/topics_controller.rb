require 'pry'
class TopicsController < ApplicationController

  get '/topics' do
   @topics = Topic.all
   erb :'/topics/index'
  end 

  get '/topics/new' do
    @posts = Post.all
    erb :'/topics/new'
  end

   post '/topics/:id' do
    # binding.pry
       @topic = Topic.find(params[:id])
      
  if @topic.user_id == current_user.id
  
    if !params["topic"]["text"].empty?
         @topic.update(params["topic"])
      # @topic = (text: params["topic"]["text"])
    end
  
     @topic.save
      else
  flash[:error] = "error."
end
    redirect to "topics/#{@topic.id}"
  end

  post '/topics' do
    # binding.pry
    @topic = Topic.create(text: params[:topic][:text], user_id: params[:topic][:user_id])
    if !params["post"]["text"].empty?
      @topic.posts << Post.create(text: "[#{current_user.username}] " + params["post"]["text"], user_id: params[:post][:user_id])
    end
    
    @topic.save 
    redirect "topics/#{@topic.id}"
  end

  post '/topics/delete/:id' do
  # binding.pry
   @topic = Topic.find(params[:id])
   @topic.delete
    
     redirect to "/topics"
  end


  get '/topics/:id' do
    @topic = Topic.find(params[:id])
    erb :'/topics/show'
  end
  

  
  
end

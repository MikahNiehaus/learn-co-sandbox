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

  

  post '/topics' do
     binding.pry
    @topic = Topic.create(text: params[:topic][:text], user_id: params[:topic][:user_id])
    if !params["post"]["text"].empty?
      @topic.posts << Post.create(text: "[#{current_user.username}] " + params["post"]["text"], user_id: params[:post][:user_id])
    end
    @topic.save 
    redirect "topics/#{@topic.id}"
  end

  get '/topics/:id/edit' do
    @topic = Topic.find(params[:id])
    # binding.pry
    erb :'/topics/edit'
  end

  get '/topics/:id' do
    @topic = Topic.find(params[:id])
    erb :'/topics/show'
  end
#make it update topics only
  post '/topics/:id' do
    # binding.pry
       @topic = Topic.find(params[:id])
      
  if @topic.user_id == current_user.id
  
    if !params["topic"]["text"].empty?
         @topic.update(params["topic"])
      # @topic = (text: params["topic"]["text"])
    end
    # if !params["post"]["text"].empty?
      # @topic.posts << Post.create(text: "[#{current_user.username}] " + params["post"]["text"])
      # binding.pry
    # end
      # binding.pry
    #   @topic = Topic.find(params[:post][:id])
   
    # if !params["topic"]["text"].empty?
    #   @topic.posts << Post.create(text: "[#{current_user.username}] " + params["topic"]["text"])
    # end
     @topic.save
      else
  flash[:error] = "."
end
    redirect to "topics/#{@topic.id}"
  end
  
  
end

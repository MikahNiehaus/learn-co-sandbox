require 'pry'
class TopicsController < ApplicationController

  get '/topics' do
   
       if logged_in? 
   @topics = Topic.all
    erb :'/topics/index'
  else
     redirect to "/failure"
   end
  end

  get '/topics/new' do
    # binding.pry
    if logged_in? 
    @posts = Post.all
    erb :'/topics/new'
  else
     redirect to "/failure"
   end
  end


  post '/topics' do
     if logged_in? 
    @topic = Topic.create(params[:topic])
    if !params["post"]["name"].empty?
      @topic.posts << Post.create(name: params["post"]["name"])
    end
    @topic.save
    redirect "topics/#{@topic.id}"
     else
     redirect to "/failure"
   end
  end

  get '/topics/:id/edit' do
     if logged_in? 
    @topic = Topic.find(params[:id])
    # binding.pry
    erb :'/topics/edit'
       else
     redirect to "/failure"
   end
  end

  get '/topics/:id' do
      if logged_in? 
    @topic = Topic.find(params[:id])
    erb :'/topics/show'
       else
     redirect to "/failure"
   end
  end

  post '/topics/:id' do
      if logged_in? 
    @topic = Topic.find(params[:id])
    @topic.update(params["topic"])
    if !params["post"]["name"].empty?
      @topic.posts << Post.create(name: params["post"]["name"])
    end
    redirect to "topics/#{@topic.id}"
      else
     redirect to "/failure"
   end
  end
end

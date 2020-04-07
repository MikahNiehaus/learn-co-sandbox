require 'pry'
class PostsController < ApplicationController

 
  get '/posts' do
     if logged_in? 
    @posts = Post.all
    erb :'/posts/index'
     else
     redirect to "/failure"
   end
  end

  get '/posts/new' do
     if logged_in? 
    @topics = Topic.all
    # binding.pry
    erb :'/posts/new'
     else
     redirect to "/failure"
   end
  end

  post '/posts' do
    if logged_in? 
    @post = Post.create(params[:post])
    if !params["topic"]["text"].empty?
      @post.topic = Topic.create(text: params["topic"]["text"])
    end
    @post.save
    redirect to "posts/#{@post.id}"
      else
     redirect to "/failure"
   end
  end

  get '/posts/:id' do
     if logged_in? 
    @post = Post.find(params[:id])
        @topics = Topic.all
    erb :'/posts/show'
        else
     redirect to "/failure"
   end
  end

get '/posts/:id/edit' do
   if logged_in? 
    @post = Post.find_by_id(params[:id])
    @topics = Topic.all
    erb :'/posts/edit'
            else
     redirect to "/failure"
   end
  end


  post '/posts/:id' do
      if logged_in? 
    @post = Post.find(params[:id])
    @post.update(params["post"])
    if !params["topic"]["text"].empty?
      @post.topic = Topic.create(text: params["topic"]["text"])
    end
    @post.save
    redirect to "posts/#{@post.id}"
                else
     redirect to "/failure"
   end
  end
end

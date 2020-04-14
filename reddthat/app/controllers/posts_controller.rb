require 'pry'
class PostsController < ApplicationController

 post '/posts' do
  # binding.pry
    @topic = Topic.find(params[:post][:topic_id])
    
    # binding.pry
    if !params["post"]["text"].empty?
      @topic.posts << Post.create(text: "[#{current_user.username}] " + params["post"]["text"], user_id: params["post"]["user_id"])
    end
    @topic.save
    redirect "topics/#{@topic.id}"
  end
    get '/posts' do
    @posts = Post.all
    erb :'/posts/index'
  end

  get '/posts/new' do
    @topics = Topic.all
    erb :'/posts/new'
  end

 post '/delete/:id' do
  # binding.pry
   @post = Post.find(params[:id])
   @post.delete
    
     redirect to "/topics/#{@post.topic_id}"
  end

  # post '/delete/:id' do
  #   @post = Post.find(params[:id])
  #   @topics = Topic.all
  #   erb :'/posts/show'
  # end

  get '/posts/:id/edit' do
   
   @topic = Topic.find(params[:id])
    @topics = Topic.all
     @posts = []
    Post.all.each do |my_post|
      if my_post.topic_id == @topic.id
        @posts << my_post
      end
    end
     
    erb :'/posts/edit'
  end


  post '/posts/:id' do
        if @topic.user_id == current_user.id
  
    
    @post = Post.find(params[:id])
    @post.text = "[#{current_user.username}] " +  params[:post][:text]
    @post.save
     else
  flash[:error] = "You can ony update your posts!."
end
    redirect to "topics/#{@post.topic_id}"
  end
  
end

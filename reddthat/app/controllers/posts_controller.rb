require 'pry'
class PostsController < ApplicationController

 post '/posts' do
    
    @topic = Topic.find(params[:post][:topic_id])
    # binding.pry
    if !params["topic"]["text"].empty?
      @topic.posts << Post.create(text: "[#{current_user.username}] " + params["topic"]["text"])
    end
    @topic.save
    redirect "topics/#{@topic.id}"
  end
  # get '/posts' do
  #   @posts = Post.all
  #   erb :'/posts/index'
  # end

  # get '/posts/new' do
  #   @topics = Topic.all
  #   erb :'/posts/new'
  # end



  # get '/posts/:id' do
  #   @post = Post.find(params[:id])
  #       @topics = Topic.all
  #   erb :'/posts/show'
  # end

  # get '/posts/:id/edit' do
  #   @post = Post.find_by_id(params[:id])
  #   @topics = Topic.all
  #   erb :'/posts/edit'
  # end


  # post '/posts/:id' do
  #   @post = Post.find(params[:id])
  #   @post.update(params["post"])
  #   if !params["topic"]["text"].empty?
  #     @post.topic = Topic.create(text: params["topic"]["text"])
  #   end
  #   @post.save
  #   redirect to "posts/#{@post.id}"
  # end
  
  
end

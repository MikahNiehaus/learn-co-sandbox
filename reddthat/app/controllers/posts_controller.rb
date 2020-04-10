require 'pry'
class PostsController < ApplicationController

 
  get '/posts' do
    @posts = Post.all
    erb :'/posts/index'
  end

  get '/posts/new' do
    @topics = Topic.all
    erb :'/posts/new'
  end

  post '/posts' do
    @post = Post.create(params[:post])
    if !params["topic"]["text"].empty?
      @post.topic = Topic.create(text: params["topic"]["text"])
    end
    @post.save
    redirect to "posts/#{@post.id}"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
        @topics = Topic.all
    erb :'/posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    @topics = Topic.all
    erb :'/posts/edit'
  end


  post '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params["post"])
    if !params["topic"]["text"].empty?
      @post.topic = Topic.create(text: params["topic"]["text"])
    end
    @post.save
    redirect to "posts/#{@post.id}"
  end
  
  
end

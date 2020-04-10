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
    @topic = Topic.create(params[:topic])
    if !params["post"]["text"].empty?
      @topic.posts << Post.create(text: params["post"]["text"])
    end
    @topic.save
    redirect "topics/#{@topic.id}"
  end

  get '/topics/:id/edit' do
    @topic = Topic.find(params[:id])
    erb :'/topics/edit'
  end

  get '/topics/:id' do
    @topic = Topic.find(params[:id])
    erb :'/topics/show'
  end

  post '/topics/:id' do
    @topic = Topic.find(params[:id])
    @topic.update(params["topic"])
    if !params["post"]["text"].empty?
      @topic.posts << Post.create(text: params["post"]["text"])
    end
    redirect to "topics/#{@topic.id}"
  end
  
  
end

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
  
end

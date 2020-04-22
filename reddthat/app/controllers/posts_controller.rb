require 'pry'
class PostsController < ApplicationController

#get '/' do
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


# used in creating a new post
#   .. create something ..
 post '/posts' do
    @topic = Topic.find(params[:post][:topic_id])
    if !params["post"]["text"].empty?
      @topic.posts << Post.create(text: "[#{current_user.username}] " + params["post"]["text"], user_id: params["post"]["user_id"])
    end
    @topic.save
    redirect "topics/#{@topic.id}"
  end
  
  #   .. show something ..
    get '/posts' do
    @posts = Post.all
    erb :'/posts/index'
  end
#   .. show something ..
  get '/posts/new' do
    @topics = Topic.all
    erb :'/posts/new'
  end
  
  # used in edit post function
  get '/posts/:id/edit' do
   @topic = Topic.find(params[:id])
    @topics = Topic.all
     @posts = []
    Post.all.each do |my_post|
      if my_post.topic_id == @topic.id && my_post.user_id == current_user.id
        @posts << my_post
      end
    end
      #Use ERB substitution and scripting tags to modify the content and structure of HTML code
    erb :'/posts/edit'
  end

# eddits the post text
#   .. modify something ..
  patch '/posts/:id' do
  if params[:post][:text] != ""
    @post = Post.find(params[:post][:post_id])
    @post.text = "[#{current_user.username}] " +  params[:post][:text]
    @post.save
   
  else
    # session[:error_message] = "Error: you need new post text"
  end
 
   redirect to "posts/#{params[:id]}/edit"
   
  end
  
  # used to delete post
   delete '/posts/delete/:id' do
    # binding.pry
begin
  @post = Post.find(params[:delete][:id])
   @post.delete
rescue StandardError => bang
end
     redirect to "/posts/#{params[:id]}/edit"
  end
  
end

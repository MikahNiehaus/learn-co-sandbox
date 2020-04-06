require 'pry'
class OwnersController < ApplicationController

  get '/owners' do
   
       if logged_in? 
   @owners = Owner.all
    erb :'/owners/index'
  else
     redirect to "/failure"
   end
  end

  get '/owners/new' do
    # binding.pry
    if logged_in? 
    @pets = Pet.all
    erb :'/owners/new'
  else
     redirect to "/failure"
   end
  end


  post '/owners' do
     if logged_in? 
    @owner = Owner.create(params[:owner])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    @owner.save
    redirect "owners/#{@owner.id}"
     else
     redirect to "/failure"
   end
  end

  get '/owners/:id/edit' do
     if logged_in? 
    @owner = Owner.find(params[:id])
    # binding.pry
    erb :'/owners/edit'
       else
     redirect to "/failure"
   end
  end

  get '/owners/:id' do
      if logged_in? 
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
       else
     redirect to "/failure"
   end
  end

  post '/owners/:id' do
      if logged_in? 
    @owner = Owner.find(params[:id])
    @owner.update(params["owner"])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect to "owners/#{@owner.id}"
      else
     redirect to "/failure"
   end
  end
end
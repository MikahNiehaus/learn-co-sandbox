require 'pry'
class PetsController < ApplicationController

 
  get '/pets' do
     if logged_in? 
    @pets = Pet.all
    erb :'/pets/index'
     else
     redirect to "/failure"
   end
  end

  get '/pets/new' do
     if logged_in? 
    @owners = Owner.all
    # binding.pry
    erb :'/pets/new'
     else
     redirect to "/failure"
   end
  end

  post '/pets' do
    if logged_in? 
    @pet = Pet.create(params[:pet])
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
      else
     redirect to "/failure"
   end
  end

  get '/pets/:id' do
     if logged_in? 
    @pet = Pet.find(params[:id])
        @owners = Owner.all
    erb :'/pets/show'
        else
     redirect to "/failure"
   end
  end

get '/pets/:id/edit' do
   if logged_in? 
    @pet = Pet.find_by_id(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
            else
     redirect to "/failure"
   end
  end


  post '/pets/:id' do
      if logged_in? 
    @pet = Pet.find(params[:id])
    @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
                else
     redirect to "/failure"
   end
  end
end
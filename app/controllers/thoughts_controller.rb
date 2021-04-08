class ThoughtsController < ApplicationController

    get '/thoughts' do 
        @thoughts = Thought.all
        erb :"thoughts/index"
    end

    get '/thoughts/new' do
        @users = User.all
        erb :"thoughts/new"
    end

    get '/thoughts/:id' do
        @thought = Thought.find_by_id(params[:id])
        erb :"thoughts/show"
    end

    post '/thoughts' do
        binding.pry
        thought = Thought.new(params)
        if thought.save
            redirect "/thoughts/#{thought.id}"
        else
            redirect "thoughts/new"
        end
    end

    get '/thoughts/:id/edit' do
        @users = User.all
        @thought = Thought.find_by_id(params[:id])
        erb :"thoughts/edit"
    end

    patch '/thoughts/:id' do
        binding.pry
        @thought = thought.find_by_id(params[:id])
        params.delete("_method")
        if @thought.update(params)
            redirect "/thoughts/#{@thought.id}"
        else
            redirect "thoughts/new"
        end
    end

    delete '/thoughts/:id' do
        @thought = Thought.find_by_id(params[:id])
        @thought.destroy
        redirect "/posts"
    end

end

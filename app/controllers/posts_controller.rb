class PostsController < ApplicationController
	
	require "coderay"
	#http_basic_authenticate_with name: "admin", password: "12345", except: [:index, :show, :new, :edit]
	
def new
	@post = Post.new
end

def edit
	@post = Post.find(params[:id])
end


def show
	@post = Post.find(params[:id])
end

def index
	@posts = Post.all
	
	if (params[:sortBy])
		if (params[:sortBy] == "problem")
			@posts = @posts.sort {|a, b| a[:problem] <=> b[:problem]}
		end
		if (params[:sortBy] == "name")
			@posts = @posts.sort {|a, b| a[:poster] <=> b[:poster]}
		end
	end
	
	if (params[:filterBy]) 
		if (params[:filterBy] == "problem")
			@posts = @posts.where(:problem => params[:problem])
		end
		if (params[:filterBy] == "name")
			@posts = @posts.where(:poster => params[:name])
		end
	end
	
end

#manually routed methods


def create
	@post = Post.new(post_params)
	#render :text post_params
	if @post.save
		redirect_to @post
	else
		render "new"
	end
end

def update
	@post = Post.find(params[:id])
	
	if @post.update(post_params)
		redirect_to @post
	else
		render "edit"
	end
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy
	
	redirect_to posts_path
end

#comment

private
	def post_params
		params.require(:post).permit(:poster, :problem, :text)
	end

end

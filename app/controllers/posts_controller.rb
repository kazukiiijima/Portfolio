class PostsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :destroy]

	def index
		@genres = Genre.all
		if params[:genre].blank?
			@posts = Post.all
		else
			@posts = Post.where(genre_id: params[:genre])
		end
	end

	def new
		@post = Post.new
		@genres = Genre.all
	end

	def show
		@post = Post.find(params[:id])
		@genre = Genre.find(params[:id])
		@favorite = Favorite.new
		@comments = @post.comments
		@comment = Comment.new
	end

	def create
		post = Post.new(post_params)
		post.user_id = current_user.id
		post.save
		redirect_to posts_path(post.id)
	end

	def destroy
		post = Post.find(params[:id])
		if post.user_id != current_user.id
    		redirect_to root_path
    	else
    		post.destroy
    		redirect_to user_path(current_user), notice: 'You have destroy book successfully.'
    	end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :genre_id)
	end

end

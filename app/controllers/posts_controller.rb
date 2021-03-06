class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		post = Post.new(post_params)
		post.user_id = current_user.id
		post.save
		redirect_to posts_path
	end

	def show
		@post = Post.find(params[:id])
		@favorite = Favorite.new
		@comments = @post.comments
		@comment = Comment.new
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
		params.require(:post).permit(:title, :body, :genre)
	end

end

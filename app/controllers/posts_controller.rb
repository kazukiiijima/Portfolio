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
		if post.save
			redirect_to posts_path
		else
			render :index
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :text,)
	end
end

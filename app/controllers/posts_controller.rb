class PostsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :destroy]

	def index
		@genres = Genre.all
		if params[:genre].blank?
			@posts = Post.all.page(params[:page]).per(5)
			@posts_rank = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
		else
			@posts = Post.where(genre_id: params[:genre]).page(params[:page]).per(5)
			@posts_rank = @posts.includes(:favorited_users).limit(3).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
		end
	end

	def new
		@post = Post.new
		@genres = Genre.all
	end

	def show
		@post = Post.find(params[:id])
		@favorite = Favorite.new
		@comments = @post.comments
		@comment = Comment.new
	end

	def create
		post = Post.new(post_params)
		post.user_id = current_user.id
		post.save
		redirect_to posts_path
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
		params.require(:post).permit(:title, :body, :genre_id, :image)
	end

end

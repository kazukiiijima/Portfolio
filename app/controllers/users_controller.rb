class UsersController < ApplicationController

	 before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@posts = @user.posts.order(created_at: :desc).page(params[:page]).per(6)
		@users = @user.favorited_posts.order(created_at: :desc).page(params[:page]).per(3)
	end

	def edit
		@user = User.find(params[:id])
		if @user == current_user
		else
			redirect_to user_path(current_user.id)
		end
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path
		flash[:notice] = "ユーザー情報の編集に成功しました"
	end

	private

	def user_params
		params.require(:user).permit(:name, :image, :profile)
	end

end

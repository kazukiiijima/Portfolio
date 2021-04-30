class UsersController < ApplicationController

	 before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@posts = @user.posts.order(created_at: :desc).page(params[:page]).per(6)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path
		flash[:notice] = "プロフィールの編集に成功しました"
	end

	private

	def user_params
		params.require(:user).permit(:name, :image, :profile)
	end

end

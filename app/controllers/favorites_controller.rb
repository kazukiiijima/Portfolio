class FavoritesController < ApplicationController

	def create
		@favorite = current_user.favorite.create
		redirect_back(fallback_location: posts_path)
	end

	def destroy
		@favorite =Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
		@favorite.destroy
		redirect_back(fallback_location: posts_path)
	end

end

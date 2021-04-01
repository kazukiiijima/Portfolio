class GenresController < ApplicationController

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		genre = Genre.new(genres_params)
		genre.save
		redirect_to genres_path
	end

	def destroy
		genre = Genre.find(params[:id])
		genre.destroy
		redirect_to genres_path
	end

	private
	def genres_params
		params.require(:genre).permit(:name)
	end
end

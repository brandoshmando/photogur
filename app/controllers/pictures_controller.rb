class PicturesController < ApplicationController
	
	def index
	end

	def new
	end

	def show
	end

	def create
		@picture = Picture.new(picture_params)

		@picture.save
		redirect_to @picture
	end

	private

	def picture_params
		params.require(:picture).permit(:title, :artist, :url)
	end
end

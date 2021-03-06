class PicturesController < ApplicationController

	def index
		@pictures = Picture.most_recent_five
	end

	def new
	end

	def create
		@picture = Picture.new(picture_params)

		@picture.save
		redirect_to @picture
	end

  def show
    @picture = Picture.find(params[:id])
  end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to @picture
    else
      render :edit
    end
	end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to root_path
  end

	private

	def picture_params
		params.require(:picture).permit(:title, :artist, :url)
	end
end

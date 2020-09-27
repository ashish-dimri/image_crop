require 'RMagick'
include Magick

class ImageCropController < ApplicationController
	def index
		@attachments = Attachment.all
	end

	def create
		debugger
		image_path = params["attachment"]["attachment"].path
		image_name = params["attachment"]["attachment"].original_filename
		image_list = Magick::ImageList.new(image_path)
		cropped_image = image_list.crop(coordinates_params[:x1].to_f, coordinates_params[:y1].to_f, coordinates_params[:w].to_f, coordinates_params[:h].to_f)
		cropped_image.write(image_name)
		# Create attachment object
		@attachment = Attachment.new(photo_params)
		@attachment.attachment = File.open image_name
		if @attachment.save
			File.delete image_name
			redirect_to root_path
		else
			File.delete image_name
		  	render 'index'
		end
	end

	private
		def photo_params
			params.require(:attachment).permit(:attachment)
		end
		def coordinates_params
			params.permit(:x1, :y1, :x2, :y2, :w, :h)
		end
end

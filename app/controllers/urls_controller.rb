class UrlsController < ApplicationController
	def new
		@url = Url.new	
	end

	def create
		@url = Url.new(uri_params)
		@url.short_url = SecureRandom.urlsafe_base64(5)
		@url.save
		redirect_to root_path
	end

	def show
		url = Url.where(short_url: params[:url]).first
		redirect_to url.full_url
	end

	private
	def uri_params
		params.require(:uri).permit(:full_url)
	end
end

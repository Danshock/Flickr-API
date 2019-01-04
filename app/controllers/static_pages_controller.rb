class StaticPagesController < ApplicationController
	require "flickraw"

	def home
		flickr_user_id = search_params[:flickr_user_id] if search_params
		flickr_user_id = "166884836@N06" if flickr_user_id.blank?
		
		begin 
			@pictures = flickr.people.getPhotos(user_id: flickr_user_id, extras: "url_m, description", per_page: 20)
		rescue FlickRaw::FailedResponse
			flash[:notice] = "Invalid user"
			redirect_to home_path
		end
	end

private

    def search_params
    	params.require(:search).permit(:flickr_user_id) if params[:search]
    end

end
class ProfilesController < ApplicationController
  
  def show

  	@profiles = Profile.find(params[:profile_id])
  	@users = User.find(@profiles.user_id)
  	@genres = GenresProfile.where(:profile_id => params[:profile_id])
  	
  	#@gID= @genres.select(:genre_id)
  	#@gName = Genre.select(:gName).where(:genre_id => @gID)
  	#Genre.select(:gName).where(Genre.movie_id: params[:movie_id], :user_id => current_user.user_id).to_a

  end

	def edit

		@profiles = Profile.find(params[:profile_id])
		@users = User.find(@profiles.user_id)
		render("edit")
	end

	def update
		@profiles = Profile.find(params[:profile_id])
		profile_params = params.require(:profile).permit(:gender,:birthday,:language)
		
		if @profiles.update(profile_params)
			redirect_to "/profiles/#{@profiles.profile_id}" 
		else
			render ("edit")
		end
	end
  # def create
  #   @profiles = Profile.new(profile_params)
  #   @profiles.user_id = current_user.id
  #   @profiles.save
  #   respond_with(@profiles)
  # end
end

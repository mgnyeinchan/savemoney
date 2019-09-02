class SessionsController < ApplicationController
	def login
		user = User.find_by(email: params[:email].downcase)
	    if user && user.authenticate(params[:password])
	      	if user.status == "active"
	      		session[:user] = user
	      		redirect_to "/"
	      	else
	      		flash[:inactive] = "Your account isn't active! Contact to Administrator."
	      		redirect_to "/"
	      	end
	      	

	    else
	    	flash[:usernotfound] = "Invalid Password !"
	    	redirect_to "/"
	  	end

	end
	def logout
		session.delete(:user)
		redirect_to "/"
	end
end

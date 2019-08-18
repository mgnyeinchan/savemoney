class SessionsController < ApplicationController
	def login
		user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      	session[:user] = user
      	redirect_to "/"

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

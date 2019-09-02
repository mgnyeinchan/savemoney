class UsersController < ApplicationController
	def register
		user = User.new(name:params[:name],email:params[:email],password:params[:password],status:"active")
		if user.save
			session[:user] = user

			redirect_to "/"
		else
			render html:"not"
		end
	end
	def changepassword
		user = User.find(session[:user]["id"])
		currentpassword = params[:currentpassword]
		newpwd = params[:newpwd]
		confirmnewpwd = params[:confirmnewpwd]
		if user && user.authenticate(params[:currentpassword])
    		if newpwd == confirmnewpwd
    			user.password = newpwd
    			user.save
    			
				session.delete(:user)
				redirect_to "/"
    		else
    			render html:"not eql"
    		end
		else
			flash[:currentpwdinvalid] = "Current Password Invalid"
		end
	end
	def usermanagement
  		@users = User.all
  	end
  	def setadmin
  		user = User.find(params[:uid])
  		user.role = "1"
  		if user.save
  			redirect_to "/usermanagement"
  		end
  	end
  	def canceladmin
  		user = User.find(params[:uid])
  		user.role = "0"
  		if user.save
  			redirect_to "/usermanagement"
  		end
  	end
  	def delusr
  		user = User.find(params[:uid])
  		user.status = "inactive"
  		if user.save
  			redirect_to "/usermanagement"
  		end
  	end
end

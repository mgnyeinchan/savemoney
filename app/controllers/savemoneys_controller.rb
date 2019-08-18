class SavemoneysController < ApplicationController
  def savemoney
  		if params[:amount]
  			sm = Savemoney.new(description:params[:description],amount:params[:amount],user_id:session[:user]["id"],time:DateTime.now.to_date)
  			if sm.save

  				flash[:successfullysavemoney] = "Successfully Saving Money !"
  				redirect_to "/savemoney"
  			else
  				flash[:insertingerror] = "Inserting Error !"
  				redirect_to "/savemoney"
  			end
  		end
  end
  def mysavingaccount
  	@savemoneys = Savemoney.where(:user_id => session[:user]["id"]) 
  	@savemoney = Savemoney.find_by(user_id:session[:user]["id"])
  	if @savemoney
  		
  	else
  		flash[:savemoneyfirst] = "You need to save money first to view saving data."
  		redirect_to "/"
  	end
  	@users = User.all
  end
  def assignshare
  	case params[:id]
  	when "1"
  		savemoneys = Savemoney.where(:user_id => session[:user]["id"]) 
  		savemoneys.each do |sm|
  			sm.showto1 = params[:showto1]
  			sm.save
  		end
=begin
  		savemoneys = Savemoney.where(:user_id => params[:showto1])
  		savemoneys.each do |sm|
  			sm.showby1 = session[:user]["id"]
  			sm.save
  		end
=end
  		redirect_to "/mysavingaccount"
  	when "2"
  		savemoneys = Savemoney.where(:user_id => session[:user]["id"]) 
  		savemoneys.each do |sm|
  			sm.showto2 = params[:showto2]
  			sm.save
  		end
=begin 		
  		savemoneys = Savemoney.where(:user_id => params[:showto2])
  		savemoneys.each do |sm|
  			sm.showby2 = session[:user]["id"]
  			sm.save
  		end
=end
  		redirect_to "/mysavingaccount"
  	else
  		savemoneys = Savemoney.where(:user_id => session[:user]["id"]) 
  		savemoneys.each do |sm|
  			sm.showto3 = params[:showto3]
  			sm.save
  		end
=begin  		
  		savemoneys = Savemoney.where(:user_id => params[:showto3])
  		savemoneys.each do |sm|
  			sm.showby3 = session[:user]["id"]
  			sm.save
  		end
=end
  		redirect_to "/mysavingaccount"
  	end
  end
  def removesharing
  	case params[:id]
  	when "1"
  		savemoneys = Savemoney.where(:user_id => session[:user]["id"]) 
  		savemoneys.each do |sm|
  			sm.showto1 = nil
  			sm.save
  		end

  		redirect_to "/mysavingaccount"
  	when "2"
  		savemoneys = Savemoney.where(:user_id => session[:user]["id"]) 
  		savemoneys.each do |sm|
  			sm.showto2 = nil
  			sm.save
  		end
  		
  		redirect_to "/mysavingaccount"
  	else
  		savemoneys = Savemoney.where(:user_id => session[:user]["id"]) 
  		savemoneys.each do |sm|
  			sm.showto3 = nil
  			sm.save
  		end
  		
  		redirect_to "/mysavingaccount"
  	end 

  end
  def familysharingaccounts
  		@savemoneys = Savemoney.where(:showto1=>session[:user]["id"]).where('extract(month  from time) = ?',Time.now.month )
  		@tmp = []
  		@savemoneys.each do |sm|
			if @tmp.length == 0
				@tmp = @tmp.push(sm.user_id)
			else
				if @tmp.last == sm.user_id
  				
  				else
  					@tmp = @tmp.push(sm.user_id)
  				end
			end
  		end
  end
end

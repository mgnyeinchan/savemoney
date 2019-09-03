class SavemoneysController < ApplicationController
  def savemoney
  		if params[:amount]
  			sm = Savemoney.new(description:params[:description],amount:params[:amount],user_id:session[:user]["id"],time:DateTime.now.to_date)
  			if sm.save

  				flash[:successfullysavemoney] = "Successfully Saving Money !"
  				redirect_to "/mysavingaccount"
  			else
  				flash[:insertingerror] = "Inserting Error !"
  				redirect_to "/savemoney"
  			end
  		end
  end
  def mysavingaccount
  	@savemoneys = Savemoney.where(:user_id => session[:user]["id"]).where('extract(month  from time) = ?',Time.now.month)  
  	@fs = Familysharing.find_by(user_id:session[:user]["id"])
    mysaving = Savemoney.where(:user_id => session[:user]["id"]).where('extract(month  from time) = ?',Time.now.month)
    @withdraw = Withdraw.where(:user_id => session[:user]["id"]).where('extract(month  from time) = ?',Time.now.month)  
  	if @fs.nil?
      fs = Familysharing.new(user_id:session[:user]["id"])
      fs.save
      @fs = Familysharing.find_by(user_id:session[:user]["id"])
    end
  	@users = User.all
  end
  def assignshare
    fs = Familysharing.find_by(user_id:session[:user]["id"])
  	case params[:id]
  	when "1"
  		if fs.nil?
        fs = Familysharing.new(user_id:session[:user]["id"],shareto1:params[:shareto1])
        fs.save
        redirect_to "/mysavingaccount"
      else
        fs.shareto1 = params[:shareto1]
        fs.save
        redirect_to "/mysavingaccount"
      end
  		
  	when "2"
  		
  		if fs.nil?
        fs = Familysharing.new(user_id:session[:user]["id"],shareto2:params[:shareto2])
        fs.save
        redirect_to "/mysavingaccount"
      else
        fs.shareto2 = params[:shareto2]
        fs.save
        redirect_to "/mysavingaccount"
      end

  		
  	else
  		
  		if fs.nil?
        fs = Familysharing.new(user_id:session[:user]["id"],shareto3:params[:shareto3])
        fs.save
        redirect_to "/mysavingaccount"
      else
        fs.shareto3 = params[:shareto3]
        fs.save
        redirect_to "/mysavingaccount"
      end
  		
  	end
  end
  def removesharing
  	fs = Familysharing.find_by(user_id:session[:user]["id"])
    case params[:id]
    when "1"
      fs.shareto1 = nil
      fs.save
      redirect_to "/mysavingaccount"
      
    when "2"
      
      fs.shareto2 = nil
      fs.save
      redirect_to "/mysavingaccount"

      
    else
      
      fs.shareto3 = nil
      fs.save
      redirect_to "/mysavingaccount"
      
    end 

  end
  def familysharingaccounts
  		@savemoneys = Savemoney.where(:showto1=>session[:user]["id"]).where('extract(month  from time) = ?',Time.now.month )
      @fs = Familysharing.where(:shareto1=>session[:user]["id"])
      @tmp = []
      @fs.each do |fs|
        if @tmp.length == 0
          @tmp = @tmp.push(fs.user_id)
        else
          tmp2 = 0
          @tmp.each do |tmp|
            
            if tmp == fs.user_id
              tmp2 = 1
            else
                
            end
          end
          if tmp2 == 0
              tmp = @tmp.push(fs.user_id)
          end
        end
      end
  end
  def withdraw
    
  end
  def savewithdraw
      withdraw = Withdraw.new(description:params[:description],amount:params[:amount],user_id:session[:user]["id"],time:DateTime.now.to_date)
      if withdraw.save
          flash[:success] ="Successfully withdraw !"
          redirect_to "/mysavingaccount"
      end
    
  end
end

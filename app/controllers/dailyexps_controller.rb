class DailyexpsController < ApplicationController
	def createdailyexp
		@dailyexps = Dailyexp.new(description:params[:description],amount:params[:amount],user_id:session[:user]["id"],time:DateTime.now.to_date)
		if @dailyexps.save
			render template:"dailyexps/view"
		else
			render html:"not"
		end
		
	end
	def createdailyexpfadv
		@dailyexps = Dailyexpfadv.new(description:params[:description],amount:params[:amount],advance_id:params[:advance_id],user_id:session[:user]["id"],time:DateTime.now.to_date)
		expamount = @dailyexps.amount
		if @dailyexps.save
			advance = Advance.find(params[:advance_id])
			if advance.currentamount == 0
				advance.currentamount = advance.amountdeposit - expamount				
			else
				advance.currentamount = advance.currentamount - @dailyexps.amount				
				
			end
			advance.save
			render template:"dailyexps/view"
		else
			render html:"not"
		end
		
	end
	def expensereports

		
		@advance = Advance.where('extract(month  from time) = ?',Time.now.month )

		@todayexps = Dailyexp.where(:time => DateTime.now.to_date)
		@todayexpfadvs = Dailyexpfadv.where(:time => DateTime.now.to_date)

		@thismonthexps = Dailyexp.where('extract(month  from time) = ?',Time.now.month )
		@thismonthexpfadvs = Dailyexpfadv.where('extract(month  from time) = ?',Time.now.month )

	end
end

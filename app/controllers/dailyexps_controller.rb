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

		@exps = Dailyexp.where('extract(month  from time) = ?',Time.now.month )
		@expfadvs = Dailyexpfadv.where('extract(month  from time) = ?',Time.now.month )

		@thismonthexps = Dailyexp.where('extract(month  from time) = ?',Time.now.month )
		@thismonthexpfadvs = Dailyexpfadv.where('extract(month  from time) = ?',Time.now.month )
		if params[:byday]
			datearr = params[:byday].to_s.split("-")
			
			@advance = Advance.where('extract(month  from time) = ?',datearr[1].to_i )
			@exps = Dailyexp.where(:time => params[:byday])
			@expfadvs = Dailyexpfadv.where(:time => params[:byday])

			@thismonthexps = Dailyexp.where(:time => params[:byday])
			@thismonthexpfadvs = Dailyexpfadv.where(:time => params[:byday])
		end
		if params[:bymonth]
			@advance = Advance.where('extract(month  from time) = ?',params[:bymonth] )
			@exps = Dailyexp.where('extract(month  from time) = ?',params[:bymonth] )
			@expfadvs = Dailyexpfadv.where('extract(month  from time) = ?',params[:bymonth] )

			@thismonthexps = Dailyexp.where('extract(month  from time) = ?',params[:bymonth] )
			@thismonthexpfadvs = Dailyexpfadv.where('extract(month  from time) = ?',params[:bymonth] )
		end
		if params[:byyear]
			@advance = Advance.where('extract(year  from time) = ?',params[:byyear] )

			@exps = Dailyexp.where('extract(year  from time) = ?',params[:byyear] )
			@expfadvs = Dailyexpfadv.where('extract(year  from time) = ?',params[:byyear] )

			@thismonthexps = Dailyexp.where('extract(year  from time) = ?',params[:byyear] )
			@thismonthexpfadvs = Dailyexpfadv.where('extract(year  from time) = ?',params[:byyear] )
		end
	end
end

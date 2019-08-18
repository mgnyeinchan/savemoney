class AdvancesController < ApplicationController
	def createadvance
		if params[:description] and params[:amount]
			@advance = Advance.new(description:params[:description],amountdeposit:params[:amount],currentamount:0,user_id:session[:user]["id"],time:DateTime.now.to_date)
			if @advance.save
				render template:"advances/view"
			else

			end
		else
			render template:"advances/add"
		end
	end
	def advancereports
		@advance = Advance.where('extract(month  from time) = ?',Time.now.month )
		
	end
end

class MonthlyauditsController < ApplicationController
	def makeaudit
		advance = Advance.where('extract(month  from time) = ?',Time.now.month )
		dailyexp = Dailyexp.where('extract(month  from time) = ?',Time.now.month )
		
		totaldepositamt = 0

		advance.each do |adv|
			totaldepositamt += adv.amountdeposit
		end

		totalbalamt = 0

		advance.each do |adv|
			totalbalamt += adv.currentamount
		end

		totalexpamt = totaldepositamt - totalbalamt
		
		totalotherexp = 0

		dailyexp.each do |dailyexp|
			totalotherexp += dailyexp.amount
		end
		ma = Monthlyaudit.find_by('extract(month  from time) = ?',Time.now.month )
		if ma
			render html:"already audit this month"
		else
			monthlyaudit = Monthlyaudit.new(totaldepositamt:totaldepositamt,totalbalamt:totalbalamt,totalexpamt:totalexpamt,totalotherexp:totalotherexp,user_id:session[:user]["id"],time:DateTime.now.to_date)
			if monthlyaudit.save
				flash[:monthyauditsuccess] = "Successfully done this month audit"
				redirect_to "/"
			else
				render html:"monthlyaudit can't save"
			end
		end
	end

	def monthlyauditreports
		@monthlyaudit = Monthlyaudit.where('extract(year  from time) = ?',Time.now.year )
	end
end

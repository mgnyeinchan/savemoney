class HomeController < ApplicationController
	def index
		@advances = Advance.all
	end
end

class SleepController < ApplicationController

	def receive
		@time = params[:time]
	end
end

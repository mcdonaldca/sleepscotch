class SleepController < ApplicationController

	def receive
		@time = params[:time]
		@name = params[:name]
		@phone = params[:phone]
		account_sid = "AC698f80b23e2836098d6f58cf7498e4e0"
		auth_token = "01d2cb9b9bea47ef35df3b1d08c17eb7"
		@client = Twilio::REST::Client.new account_sid, auth_token
		seconds = Time.parse(@time) - Time.now
		sleep seconds
		message = @client.account.messages.create(
			:body => "This is a reminder text from Hopscotch.  It's "+@time+", which means it's time to go to "+@name+"!",
			:to => @phone,
			:from => "+13172520150")
		puts message.sid
		
	end
end

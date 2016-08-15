class MessagesController < ApplicationController
#  skip_before_filter :verify_authenticity_token

  def reply
    @ingredients = params["Body"]
    from_number = params["From"]
    boot_twilio

    p @ingredients
    p @ingredients
    p params["Body"]
    p params["From"]
    p params from_number

    sms = @client.account.sms.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: from_number,
      body: "It's Forked. Your number is #{from_number}."
    )
  end

  def create
  end

  private

  def boot_twilio
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_SECRET_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end

class GiveawayMailer < ActionMailer::Base
  default from: "giveaways@altimarc.com"
  
  def registration_confirmation(giveaway)
    @giveaway = giveaway
    mail(:to => "#{giveaway.email}", :subject => "Registered")
  end

end

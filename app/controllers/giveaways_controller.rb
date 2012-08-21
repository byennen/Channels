class GiveawaysController < ApplicationController
  def index
  end

  def derby
  end

  def cma
  end

  def thankyou
  end

  def enter_giveaway
    @giveaway = Giveaway.new(params[:giveaway])
    if @giveaway.save
      GiveawayMailer.registration_confirmation(@giveaway).deliver
      flash[:success] = "You're registered!"
    else
      flash[:error] = "Please check your email or confirm that you haven't entered already."
    end
    redirect_to root_url
  end

end

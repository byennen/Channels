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
      flash[:notice] = "event was successfully created."
    else
      flash[:error] = "didnt work"
    end
    redirect_to root_url
  end

end

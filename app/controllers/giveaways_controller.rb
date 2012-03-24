class GiveawaysController < ApplicationController
  
  def derby
    @giveaway = Giveaway.new
  end

  def cma
    @giveaway = Giveaway.new
  end

  def thankyou
  end

  def create_cma
    @giveaway = Giveaway.new(params[:giveaway])

    respond_to do |format|
      if @giveaway.save
        GiveawayMailer.registration_confirmation(@giveaway).deliver
        format.html { redirect_to thankyou_path, notice: "You're registration for CMA FanFest!." }
      else
        format.html { render action: "cma" }
      end
    end
  end

  def create_derby
    @giveaway = Giveaway.new(params[:giveaway])

    respond_to do |format|
      if @giveaway.save
        GiveawayMailer.registration_confirmation(@giveaway).deliver
        format.html { redirect_to thankyou_path, notice: "You're registration for the Kentucky Derby!" }
      else
        format.html { render action: "derby" }
      end
    end
  end

end


class AdsController < ApplicationController
  def next
  	render :json => Ad.next_ad()
  end
end

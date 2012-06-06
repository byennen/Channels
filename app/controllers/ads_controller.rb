
class AdsController < ApplicationController
  def index
  end

  def next
  	Ad.next_ad()
  end
end

require 'spec_helper'

describe PagesController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'privacy'" do
    it "returns http success" do
      get 'privacy'
      response.should be_success
    end
  end

  describe "GET 'refund'" do
    it "returns http success" do
      get 'refund'
      response.should be_success
    end
  end

end

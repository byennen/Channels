require 'spec_helper'

describe Video do
  
  describe 'validations' do
    
      before do
        @video = Video.new(:publish_on => '09/12/2012')
        @video.valid?
      end
      
      it "should not be valid" do
        @video.valid?.should == false
      end
      
      it "should have error message 'Image must be present'" do
        @video.errors[:publish_on].should == ["Image must be present before publishing"]
      end
      
  end
  
end
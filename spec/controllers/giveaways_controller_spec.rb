require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe GiveawaysController do

  # This should return the minimal set of attributes required to create a valid
  # Giveaway. As you add validations to Giveaway, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GiveawaysController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all giveaways as @giveaways" do
      giveaway = Giveaway.create! valid_attributes
      get :index, {}, valid_session
      assigns(:giveaways).should eq([giveaway])
    end
  end

  describe "GET show" do
    it "assigns the requested giveaway as @giveaway" do
      giveaway = Giveaway.create! valid_attributes
      get :show, {:id => giveaway.to_param}, valid_session
      assigns(:giveaway).should eq(giveaway)
    end
  end

  describe "GET new" do
    it "assigns a new giveaway as @giveaway" do
      get :new, {}, valid_session
      assigns(:giveaway).should be_a_new(Giveaway)
    end
  end

  describe "GET edit" do
    it "assigns the requested giveaway as @giveaway" do
      giveaway = Giveaway.create! valid_attributes
      get :edit, {:id => giveaway.to_param}, valid_session
      assigns(:giveaway).should eq(giveaway)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Giveaway" do
        expect {
          post :create, {:giveaway => valid_attributes}, valid_session
        }.to change(Giveaway, :count).by(1)
      end

      it "assigns a newly created giveaway as @giveaway" do
        post :create, {:giveaway => valid_attributes}, valid_session
        assigns(:giveaway).should be_a(Giveaway)
        assigns(:giveaway).should be_persisted
      end

      it "redirects to the created giveaway" do
        post :create, {:giveaway => valid_attributes}, valid_session
        response.should redirect_to(Giveaway.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved giveaway as @giveaway" do
        # Trigger the behavior that occurs when invalid params are submitted
        Giveaway.any_instance.stub(:save).and_return(false)
        post :create, {:giveaway => {}}, valid_session
        assigns(:giveaway).should be_a_new(Giveaway)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Giveaway.any_instance.stub(:save).and_return(false)
        post :create, {:giveaway => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested giveaway" do
        giveaway = Giveaway.create! valid_attributes
        # Assuming there are no other giveaways in the database, this
        # specifies that the Giveaway created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Giveaway.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => giveaway.to_param, :giveaway => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested giveaway as @giveaway" do
        giveaway = Giveaway.create! valid_attributes
        put :update, {:id => giveaway.to_param, :giveaway => valid_attributes}, valid_session
        assigns(:giveaway).should eq(giveaway)
      end

      it "redirects to the giveaway" do
        giveaway = Giveaway.create! valid_attributes
        put :update, {:id => giveaway.to_param, :giveaway => valid_attributes}, valid_session
        response.should redirect_to(giveaway)
      end
    end

    describe "with invalid params" do
      it "assigns the giveaway as @giveaway" do
        giveaway = Giveaway.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Giveaway.any_instance.stub(:save).and_return(false)
        put :update, {:id => giveaway.to_param, :giveaway => {}}, valid_session
        assigns(:giveaway).should eq(giveaway)
      end

      it "re-renders the 'edit' template" do
        giveaway = Giveaway.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Giveaway.any_instance.stub(:save).and_return(false)
        put :update, {:id => giveaway.to_param, :giveaway => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested giveaway" do
      giveaway = Giveaway.create! valid_attributes
      expect {
        delete :destroy, {:id => giveaway.to_param}, valid_session
      }.to change(Giveaway, :count).by(-1)
    end

    it "redirects to the giveaways list" do
      giveaway = Giveaway.create! valid_attributes
      delete :destroy, {:id => giveaway.to_param}, valid_session
      response.should redirect_to(giveaways_url)
    end
  end

end

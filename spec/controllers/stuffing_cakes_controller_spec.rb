require 'rails_helper'

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

RSpec.describe StuffingCakesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # StuffingCake. As you add validations to StuffingCake, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StuffingCakesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all stuffing_cakes as @stuffing_cakes" do
      stuffing_cake = StuffingCake.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:stuffing_cakes)).to eq([stuffing_cake])
    end
  end

  describe "GET #show" do
    it "assigns the requested stuffing_cake as @stuffing_cake" do
      stuffing_cake = StuffingCake.create! valid_attributes
      get :show, {:id => stuffing_cake.to_param}, valid_session
      expect(assigns(:stuffing_cake)).to eq(stuffing_cake)
    end
  end

  describe "GET #new" do
    it "assigns a new stuffing_cake as @stuffing_cake" do
      get :new, {}, valid_session
      expect(assigns(:stuffing_cake)).to be_a_new(StuffingCake)
    end
  end

  describe "GET #edit" do
    it "assigns the requested stuffing_cake as @stuffing_cake" do
      stuffing_cake = StuffingCake.create! valid_attributes
      get :edit, {:id => stuffing_cake.to_param}, valid_session
      expect(assigns(:stuffing_cake)).to eq(stuffing_cake)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new StuffingCake" do
        expect {
          post :create, {:stuffing_cake => valid_attributes}, valid_session
        }.to change(StuffingCake, :count).by(1)
      end

      it "assigns a newly created stuffing_cake as @stuffing_cake" do
        post :create, {:stuffing_cake => valid_attributes}, valid_session
        expect(assigns(:stuffing_cake)).to be_a(StuffingCake)
        expect(assigns(:stuffing_cake)).to be_persisted
      end

      it "redirects to the created stuffing_cake" do
        post :create, {:stuffing_cake => valid_attributes}, valid_session
        expect(response).to redirect_to(StuffingCake.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved stuffing_cake as @stuffing_cake" do
        post :create, {:stuffing_cake => invalid_attributes}, valid_session
        expect(assigns(:stuffing_cake)).to be_a_new(StuffingCake)
      end

      it "re-renders the 'new' template" do
        post :create, {:stuffing_cake => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested stuffing_cake" do
        stuffing_cake = StuffingCake.create! valid_attributes
        put :update, {:id => stuffing_cake.to_param, :stuffing_cake => new_attributes}, valid_session
        stuffing_cake.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested stuffing_cake as @stuffing_cake" do
        stuffing_cake = StuffingCake.create! valid_attributes
        put :update, {:id => stuffing_cake.to_param, :stuffing_cake => valid_attributes}, valid_session
        expect(assigns(:stuffing_cake)).to eq(stuffing_cake)
      end

      it "redirects to the stuffing_cake" do
        stuffing_cake = StuffingCake.create! valid_attributes
        put :update, {:id => stuffing_cake.to_param, :stuffing_cake => valid_attributes}, valid_session
        expect(response).to redirect_to(stuffing_cake)
      end
    end

    context "with invalid params" do
      it "assigns the stuffing_cake as @stuffing_cake" do
        stuffing_cake = StuffingCake.create! valid_attributes
        put :update, {:id => stuffing_cake.to_param, :stuffing_cake => invalid_attributes}, valid_session
        expect(assigns(:stuffing_cake)).to eq(stuffing_cake)
      end

      it "re-renders the 'edit' template" do
        stuffing_cake = StuffingCake.create! valid_attributes
        put :update, {:id => stuffing_cake.to_param, :stuffing_cake => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested stuffing_cake" do
      stuffing_cake = StuffingCake.create! valid_attributes
      expect {
        delete :destroy, {:id => stuffing_cake.to_param}, valid_session
      }.to change(StuffingCake, :count).by(-1)
    end

    it "redirects to the stuffing_cakes list" do
      stuffing_cake = StuffingCake.create! valid_attributes
      delete :destroy, {:id => stuffing_cake.to_param}, valid_session
      expect(response).to redirect_to(stuffing_cakes_url)
    end
  end

end

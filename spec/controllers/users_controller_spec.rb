require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
    end


    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "devrait trouver le bon utilisateur" do
      get :show, :id => @user
      assigns(:user).should == @user
    end





  end

end

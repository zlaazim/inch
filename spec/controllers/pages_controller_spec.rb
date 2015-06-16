require 'rails_helper'

RSpec.describe PagesController, type: :controller do
render_views

before(:each) do
    #
    # Define @base_title here.
      @base_title = "Simple App du Tutoriel Ruby on Rails"
    #

  end



  describe "GET #home" do

    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end 
   
     it "should have the right title" do
    get :home
      expect(response.body).to have_selector("title",  :text =>  @base_title + " | Accueil" )
  end
    
    end
  
    describe "GET #contact" do

    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end 
   
   
    
    end

 describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
   it "should have the right title" do
    get :about
     expect(response.body).to have_selector("title",  :text => @base_title + " | A Propos")
  end
    end



describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
   #it "should have the right title" do
    #get :help
     #expect(response.body).to have_selector("title",  :text => @base_title + " | Aide")
    # expect(page).to have_title @base_title + " | Aide"
  #end
    end


end

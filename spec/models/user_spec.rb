# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nom        :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
     before(:each) do
    @attr = { :nom => "Example User", :email => "user@example.com" }
  end

  it "devrait créer une nouvelle instance dotée des attributs valides" do
    User.create!(@attr)
  end

  it "devrait exiger un nom" do
  	bad_guy = User.new(@attr.merge(:nom => ""))
  	#bad_guy.should_not be_valid
  	expect(bad_guy).not_to be_valid
  end	

 it "devrait exiger un email" do
  	noemailuser = User.new(@attr.merge(:email => ""))
  	expect(noemailuser).not_to be_valid
 end

    it "devrait pas depasser 10 caractere" do
	long_nom = "a" * 51
  	long_nom_user = User.new(@attr.merge(:nom => long_nom))
  	expect(long_nom_user).not_to be_valid
    end
  
    it "devrait rejeter un email double" do
    # Place un utilisateur avec un email donné dans la BD.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email).not_to be_valid  
    end
  
    it "devrait rejeter une adresse email invalide jusqu'à la casse" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email).not_to be_valid 
     end

    it "devrait accepter une adresse email valide" do
    adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    adresses.each do |address|
    valid_email_user = User.new(@attr.merge(:email => address))
    expect(valid_email_user).to be_valid  
    end
	end
 
    it "devrait rejeter une adresse email invalide" do
    adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    adresses.each do |address|
    invalid_email_user = User.new(@attr.merge(:email => address))
    expect(invalid_email_user).not_to be_valid  
    end

   end
end
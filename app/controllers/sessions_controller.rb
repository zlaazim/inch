class SessionsController < ApplicationController
  def new
  	@titre = "Sign in"
  end

 def create
 	 user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Combinaison Email/Mot de passe invalide."
      @titre = "S'identifier"
 	  render 'new'
 else
      sign_in user
      redirect_back_or user
end
 end

  def destroy
    sign_out
    redirect_to root_path
  end



end

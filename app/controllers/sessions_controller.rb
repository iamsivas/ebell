class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		login user
      params[:session][:remember_me] == 1 ? remember(user) : forget(user)
  		redirect_to admin_path
  	else
  		flash[:error] = "Invalid E-mail or Password"
  		render 'new'
  	end
  end

  def destroy
  	logout if sign_in?
  	redirect_to root_path
  end
end

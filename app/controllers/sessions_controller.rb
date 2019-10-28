class SessionsController < ApplicationController 
  
  def new
    @user = User.new 
  end 

  def omniauth
    @user = User.create_by_github_omniauth(auth_hash)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else 
       flash[:notice] = "Incorrect email or password"
       redirect_to '/signin'
      end
    end
  end 

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

 private

  def auth_hash 
   request.env['omniauth.auth']
  end
end

 
  
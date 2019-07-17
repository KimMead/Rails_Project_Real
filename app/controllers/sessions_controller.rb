class SessionsController < ApplicationController 
  
  def new
    @user = User.new 
  end 

  def create
    
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
       flash[:message] = "Sorry, please try again"
       redirect_to login_path
    end
 end


 def oauth_login
   @user = User.from_omniauth(auth)
   @user.save
   session[:user_id] = @user.id
  redirect_to user_path(@user.id)
 end

 def destroy
   session.clear
   redirect_to root_path
 end


 private

   def auth
   request.env['omniauth.auth']
 end
end

  # def create     
  #   auth = request.env["omniauth.auth"]     
  #   user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.find_or_create_by_omniauth(auth)     
  #   binding.pry
  #   session[:user_id] = user.id     
  #   redirect_to user_path(@user.id) 
  # end
 
    # def create 
    #   @user = User.find_by(email: params[:user][:email])
    #   if @user && @user.authenticate(params[:user][:password])
    #     session[:user_id] = @user.id 
    #     redirect_to user_path(@user) 
    #   else
    #     flash[:notice] = "Incorrect email or password"
    #     redirect_to '/signin'
    #   end 
    # end 

#   def destroy 
#     session.delete :user_id
#     redirect_to root_path
#   end 

#   private
  
#   def auth
#     request.env['omniauth.auth']
#   end
# end 
     
    
# def omniauth
  #   @user = User.create_by_github_omniauth(auth_hash)

  #   session[:user_id] = @user.id
  #   redirect_to user_path(@user)
  # end

  # def githubcreate 
    
  #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
  #     u.name = auth['info']['name']
  #     u.email = auth['info']['email']
  #     u.password = 'password'

  #   end
  #   @user.save
  #   session[:user_id] = @user.id
  #   redirect_to user_path(@user)
  # end

  # def githubcreate 
      
  #   auth = request.env["omniauth.auth"]     
  #   user = User.find_or_create_by(auth["provider"], auth["uid"]) || User.find_or_create_by_omniauth(auth)     
  #   session[:user_id] = user.id     
  #   redirect_to root_url, :notice => "Signed in!"
  # end

  # def githubcreate     
  #   auth = request.env["omniauth.auth"]     
  #   user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
  #   session[:user_id] = user.id    
  #   redirect_to user_path(@user)
  # end
#  
  # def githubcreate
    
  #   auth = request.env["omniauth.auth"]
  #     user = User.find_or_create_by_omniauth(auth)
  #     session[:user_id] = user.id 

  #     redirect_to user_path(@user)
     
  # end
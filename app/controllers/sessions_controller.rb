class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    puts "hello #{user}"
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      puts "NOPE SOMETHING WRONG"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

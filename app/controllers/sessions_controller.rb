class SessionsController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    @user = User.find_by(email: params["user"]["email"])

    if @user && @user.password == params["user"]["password"]
      session[:user_id] = @user.id

      redirect_to(lists_path)
    else
      redirect_to(login_path)
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to login_path
  end
end

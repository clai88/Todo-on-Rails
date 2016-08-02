class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.sign_up(params.require(:user).permit(:email, :password, :full_name, :password_confirmation))

    if @user.valid?
      redirect_to(clients_path)
    else
      render :new
    end
  end
end

end

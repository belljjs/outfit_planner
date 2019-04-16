class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
      p "**** users#create ****"
      p "params[:user]: ", params[:user]

      @user = params[:user] ? User.new(user_params) : User.new_guest
      p "before save" , @user
      
      if @user.save
          p "after save", @user

          session[:user_id] = @user.id
          redirect_to start_outfits_path
      else
          render :new
      end
  end

  private
  def user_params
  params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation
  )
  end
end

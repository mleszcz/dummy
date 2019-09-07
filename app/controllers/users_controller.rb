class UsersController < Clearance::UsersController
  def create
    @user = User.new(user_details)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render 'new'
    end
  end

  private

  def user_details
    params.require(:user).permit(:name, :email, :password)
  end
end

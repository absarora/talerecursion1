class Users::RegistrationsController < Devise::RegistrationsController

  def sign_up_params
     params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :name, :provider, :uid)
  end

end
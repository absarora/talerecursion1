class Api::SessionsController < Api::BasesController
  prepend_before_filter :require_no_authentication, :only => [:create]
  # before_filter :validate_auth_token, :except => :create
  # include Devise::Controllers::Helpers
  # include ApiHelper

  respond_to :json
  
  def new
 
  end

  def create
   user = User.find_or_create_by(email: email_params) do |u|
      u.name = name_params
      u.facebook_id = id_params
    end
    # return invalid_login_attempt unless user
    render :json=> {:success=>true, :message=>"User is logged in!"}
  end
  
  def destroy
    sign_out(@user)
    redirect_to "/"
  end
 
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end

  private
    def email_params
      params.permit(:email)
    end

    def name_params
      params.permit(:name)
    end

    def id_params
      params.permit(:id)
    end

end
class Api::SessionsController < Api::BasesController
  prepend_before_filter :require_no_authentication, :only => [:create]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  # before_filter :validate_auth_token, :except => :create
  # include Devise::Controllers::Helpers
  # include ApiHelper
  
  # before_filter :ensure_params_exist
 
  respond_to :json
  
  def create
    build_resource
    resource = User.find_for_database_authentication(:email => params[:user][:email])
    return invalid_login_attempt unless resource
 
    if resource.valid_password?(params[:user][:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token!
      render :json=> {:success=>true, :auth_token=>resource.authentication_token}
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    sign_out(@user)
    redirect_to :
  end
 
  protected
  # def ensure_params_exist
  #   puts params
  #   puts "------------"*5
  #   puts "testing"
  #   return unless params[:email].blank?
  #   puts "------------"*5
  #   render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  #   puts "------------"*5
  # end
 
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
end
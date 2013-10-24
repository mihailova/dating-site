
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  layout false

  def facebook
    if user_signed_in?
      if current_user.email == request.env["omniauth.auth"].info.email
        current_user.add_fb_account(request.env["omniauth.auth"])
        @redirect_to = root_url
      else
        flash[:notice] = "The e-mail is not correct"
        @redirect_to = root_url
      end
    else
      @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
        @redirect_to = root_url
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"].except("extra")
        @redirect_to = new_user_registration_url
      end
    end
  end
end
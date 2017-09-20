class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    oauth_provider 'facebook'
  end

  def google_oauth2
    oauth_provider 'google_oauth2'
  end

  def amazon
    oauth_provider 'amazon'
  end

  def failure
    redirect_to root_path
  end

  private

  def oauth_provider(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider[/\A[a-z]+/].capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end

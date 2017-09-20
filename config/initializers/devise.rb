require "omniauth-google-oauth2"
require "omniauth-amazon"

Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  config.omniauth :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET']
  config.omniauth :amazon, ENV['AMAZON_APP_ID'], ENV['AMAZON_APP_SECRET']
end

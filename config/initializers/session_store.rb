# Be sure to restart your server when you modify this file.

def domain
  if Rails.env.production?
    ".altimarc.com"
  elsif Rails.env.staging?
    ".altimarc-staging.com"
  elsif Rails.env.development?
    ".channels.dev"
  end
end
Channels::Application.config.session_store :cookie_store, {key: '_channels_session',
                                                           domain: domain}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Channels::Application.config.session_store :active_record_store

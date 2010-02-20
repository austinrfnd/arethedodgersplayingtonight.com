# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dodgers_session',
  :secret      => '4debbe5a7c198de6c40f4b956bce24e1c6344142610dfb7d42979cc4e6423d8723f5e63c115ec13047f4838bd245170545d1d90d30857e0f1600480fb0e80ebd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

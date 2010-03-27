# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_agnus_bdd_codetest_session',
  :secret      => '9f2c69654ce810c7bab7f622a28f1ec467eea960c48e3c85399fdf5a0cf513aa6b56f2c9adf1c2738285ee297479875eeecdc5b39df0ba72bb5dcefdc0d3c7eb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
